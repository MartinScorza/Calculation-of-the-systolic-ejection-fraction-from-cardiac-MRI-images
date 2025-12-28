function maskLV = bestLVMaskFromLabels(I8, L)
% Devuelve la máscara del VI a partir de (I8, L) donde:
% - I8 es uint8 (misma size que L)
% - L es salida de imsegkmeans

    if ~isa(I8,'uint8')
        I8 = im2uint8(mat2gray(I8));
    end

    [rows, cols] = size(I8);
    K = double(max(L(:)));

    % Umbrales robustos (relativos al tamaño de la ROI)
    A_min = round(0.002 * rows * cols);   % ~0.2%
    A_max = round(0.30  * rows * cols);   % 30% (evita "toda la imagen")

    % Guardar candidatos (máscara + puntaje interno)
    bestVal = -Inf;
    maskLV  = false(rows, cols);

    % --- 1) Recolectar y evaluar componentes ---
    for lab = 1:K
        m = (L == lab);

        % eliminar basura chica
        m = bwareaopen(m, A_min);

        CC = bwconncomp(m);
        if CC.NumObjects == 0, continue; end

        stats = regionprops(CC, I8, "Area","Centroid","MeanIntensity","Perimeter","Solidity","Eccentricity","BoundingBox");

        for i = 1:numel(stats)
            A  = stats(i).Area;
            cx = stats(i).Centroid(1);
            mi = stats(i).MeanIntensity;
            P  = stats(i).Perimeter;
            sol = stats(i).Solidity;
            ecc = stats(i).Eccentricity;
            bb  = stats(i).BoundingBox; % [x y w h]

            % circularidad (1 ideal)
            circ = 4*pi*A / (P^2 + eps);

            % --- Filtros duros (evitan tus fallos) ---
            if A < A_min || A > A_max
                continue;
            end

            % componente tocando borde? (por bounding box)
            touchesBorder = (bb(1) <= 1) || (bb(2) <= 1) || ((bb(1)+bb(3)) >= cols) || ((bb(2)+bb(4)) >= rows);
            if touchesBorder
                continue;
            end

            % prior anatómico: VI está a la derecha
            if cx < 0.55*cols
                continue;
            end

            % evitar RV/crescentes: circularidad y solidez mínimas
            if circ < 0.35 || sol < 0.75
                continue;
            end

            % --- score interno (NO se devuelve) ---
            nx   = cx/cols;
            nmi  = double(mi)/255;
            val = 2.0*nmi + 1.5*nx + 1.0*circ + 0.8*sol - 0.6*ecc + 0.3*log(A+1);

            if val > bestVal
                bestVal = val;
                maskLV = false(rows, cols);
                maskLV(CC.PixelIdxList{i}) = true;
            end
        end
    end

    % --- 2) Fallback si no quedó nada (relajo filtros) ---
    if bestVal == -Inf
        % Relajar: permito circularidad/solidez más bajas pero sigo evitando bordes
        for lab = 1:K
            m = bwareaopen(L == lab, A_min);
            CC = bwconncomp(m);
            if CC.NumObjects == 0, continue; end
            stats = regionprops(CC, I8, "Area","Centroid","MeanIntensity","Perimeter","Solidity","Eccentricity","BoundingBox");

            for i = 1:numel(stats)
                A  = stats(i).Area;
                cx = stats(i).Centroid(1);
                mi = stats(i).MeanIntensity;
                P  = stats(i).Perimeter;
                sol = stats(i).Solidity;
                ecc = stats(i).Eccentricity;
                bb  = stats(i).BoundingBox;

                circ = 4*pi*A / (P^2 + eps);

                if A < A_min || A > A_max, continue; end
                touchesBorder = (bb(1) <= 1) || (bb(2) <= 1) || ((bb(1)+bb(3)) >= cols) || ((bb(2)+bb(4)) >= rows);
                if touchesBorder, continue; end

                % acá solo exijo estar a la derecha
                if cx < 0.55*cols, continue; end

                nx = cx/cols; nmi = double(mi)/255;
                val = 2.0*nmi + 1.5*nx + 0.6*circ + 0.4*sol - 0.5*ecc + 0.2*log(A+1);

                if val > bestVal
                    bestVal = val;
                    maskLV = false(rows, cols);
                    maskLV(CC.PixelIdxList{i}) = true;
                end
            end
        end
    end

    % --- 3) Post-proceso final ---
    maskLV = imfill(maskLV, "holes");
    maskLV = imclose(maskLV, strel("disk", 3));
    maskLV = imopen(maskLV, strel("disk", 1));
    maskLV = bwareafilt(maskLV, 1); % dejar el mayor componente
end