%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FIORITI Federico
%%% MAZZANTE Lorenzo
%%% SCORZA Martín
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

addpath(genpath(pwd));

img1_sys = dicomread('IM-0009-0020.dcm');
img1_dias = dicomread('IM-0009-0028.dcm');
img2_sys = dicomread('IM-0009-0040.dcm');
img2_dias = dicomread('IM-0009-0048.dcm');
img3_sys = dicomread('IM-0009-0060.dcm');
img3_dias = dicomread('IM-0009-0068.dcm');
img4_sys = dicomread('IM-0009-0080.dcm');
img4_dias = dicomread('IM-0009-0088.dcm');
img5_sys = dicomread('IM-0009-0100.dcm');
img5_dias = dicomread('IM-0009-0108.dcm');

%% ================== 1. Plot original images =========================
figure;
subplot(2,5,1);
imagesc(img1_sys); colormap('gray'); title('Image1 Systole Original');
subplot(2,5,6);
imagesc(img1_dias); colormap('gray'); title('Image1 Diastole Original');

subplot(2,5,2);
imagesc(img2_sys); colormap('gray'); title('Image2 Systole Original');
subplot(2,5,7);
imagesc(img2_dias); colormap('gray'); title('Image2 Diastole Original');

subplot(2,5,3);
imagesc(img3_sys); colormap('gray'); title('Image3 Systole Original');
subplot(2,5,8);
imagesc(img3_dias); colormap('gray'); title('Image3 Diastole Original');

subplot(2,5,4);
imagesc(img4_sys); colormap('gray'); title('Image4 Systole Original');
subplot(2,5,9);
imagesc(img4_dias); colormap('gray'); title('Image4 Diastole Original');

subplot(2,5,5);
imagesc(img5_sys); colormap('gray'); title('Image5 Systole Original');
subplot(2,5,10);
imagesc(img5_dias); colormap('gray'); title('Image5 Diastole Original');

%% ================== 2. Recorte cuadrado =============================
idx1 = 70;
idx2 = 170;

img1_sys_carre  = img1_sys(idx1:idx2,idx1:idx2);
img2_sys_carre  = img2_sys(idx1:idx2,idx1:idx2);
img3_sys_carre  = img3_sys(idx1:idx2,idx1:idx2);
img4_sys_carre  = img4_sys(idx1:idx2,idx1:idx2);
img5_sys_carre  = img5_sys(idx1:idx2,idx1:idx2);

img1_dias_carre = img1_dias(idx1:idx2,idx1:idx2);
img2_dias_carre = img2_dias(idx1:idx2,idx1:idx2);
img3_dias_carre = img3_dias(idx1:idx2,idx1:idx2);
img4_dias_carre = img4_dias(idx1:idx2,idx1:idx2);
img5_dias_carre = img5_dias(idx1:idx2,idx1:idx2);

figure;
subplot(2,5,1);
imagesc(img1_sys_carre); colormap('gray'); title('Image1 Systole Reduced');
subplot(2,5,6);
imagesc(img1_dias_carre); colormap('gray'); title('Image1 Diastole Reduced');

subplot(2,5,2);
imagesc(img2_sys_carre); colormap('gray'); title('Image2 Systole Reduced');
subplot(2,5,7);
imagesc(img2_dias_carre); colormap('gray'); title('Image2 Diastole Reduced');

subplot(2,5,3);
imagesc(img3_sys_carre); colormap('gray'); title('Image3 Systole Reduced');
subplot(2,5,8);
imagesc(img3_dias_carre); colormap('gray'); title('Image3 Diastole Reduced');

subplot(2,5,4);
imagesc(img4_sys_carre); colormap('gray'); title('Image4 Systole Reduced');
subplot(2,5,9);
imagesc(img4_dias_carre); colormap('gray'); title('Image4 Diastole Reduced');

subplot(2,5,5);
imagesc(img5_sys_carre); colormap('gray'); title('Image5 Systole Reduced');
subplot(2,5,10);
imagesc(img5_dias_carre); colormap('gray'); title('Image5 Diastole Reduced');

%% ================== 3. Transformación S-curve =======================
k  = 10;
x0 = 0.5;
s_curve = @(I) 1 ./ (1 + exp(-k * (I - x0)));

img1_sys_S   = s_curve(mat2gray(img1_sys_carre));
img2_sys_S   = s_curve(mat2gray(img2_sys_carre));
img3_sys_S   = s_curve(mat2gray(img3_sys_carre));
img4_sys_S   = s_curve(mat2gray(img4_sys_carre));
img5_sys_S   = s_curve(mat2gray(img5_sys_carre));

img1_dias_S  = s_curve(mat2gray(img1_dias_carre));
img2_dias_S  = s_curve(mat2gray(img2_dias_carre));
img3_dias_S  = s_curve(mat2gray(img3_dias_carre));
img4_dias_S  = s_curve(mat2gray(img4_dias_carre));
img5_dias_S  = s_curve(mat2gray(img5_dias_carre));

figure;
subplot(2,5,1);
imagesc(img1_sys_S); colormap('gray'); title('Image1 Systole S-curve');
subplot(2,5,6);
imagesc(img1_dias_S); colormap('gray');title('Image1 Diastole S-curve');

subplot(2,5,2);
imagesc(img2_sys_S); colormap('gray');title('Image2 Systole S-curve');
subplot(2,5,7);
imagesc(img2_dias_S); colormap('gray');title('Image2 Diastole S-curve');

subplot(2,5,3);
imagesc(img3_sys_S); colormap('gray');title('Image3 Systole S-curve');
subplot(2,5,8);
imagesc(img3_dias_S); colormap('gray');title('Image3 Diastole S-curve');

subplot(2,5,4);
imagesc(img4_sys_S); colormap('gray');title('Image4 Systole S-curve');
subplot(2,5,9);
imagesc(img4_dias_S); colormap('gray');title('Image4 Diastole S-curve');

subplot(2,5,5);
imagesc(img5_sys_S); colormap('gray');title('Image5 Systole S-curve');
subplot(2,5,10);
imagesc(img5_dias_S); colormap('gray');title('Image5 Diastole S-curve');

%% ================== 4. Binarización ================================
img1_sys_bin  = imbinarize(img1_sys_S);
img2_sys_bin  = imbinarize(img2_sys_S);
img3_sys_bin  = imbinarize(img3_sys_S);
img4_sys_bin  = imbinarize(img4_sys_S);
img5_sys_bin  = imbinarize(img5_sys_S);

img1_dias_bin = imbinarize(img1_dias_S);
img2_dias_bin = imbinarize(img2_dias_S);
img3_dias_bin = imbinarize(img3_dias_S);
img4_dias_bin = imbinarize(img4_dias_S);
img5_dias_bin = imbinarize(img5_dias_S);

figure;
subplot(2,5,1);
imagesc(img1_sys_bin); colormap('gray'); title('Image1 Systole Binarized');
subplot(2,5,6);
imagesc(img1_dias_bin); colormap('gray');title('Image1 Diastole Binarized');

subplot(2,5,2);
imagesc(img2_sys_bin); colormap('gray');title('Image2 Systole Binarized');
subplot(2,5,7);
imagesc(img2_dias_bin); colormap('gray');title('Image2 Diastole Binarized');

subplot(2,5,3);
imagesc(img3_sys_bin); colormap('gray');title('Image3 Systole Binarized');
subplot(2,5,8);
imagesc(img3_dias_bin); colormap('gray');title('Image3 Diastole Binarized');

subplot(2,5,4);
imagesc(img4_sys_bin); colormap('gray');title('Image4 Systole Binarized');
subplot(2,5,9);
imagesc(img4_dias_bin); colormap('gray');title('Image4 Diastole Binarized');

subplot(2,5,5);
imagesc(img5_sys_bin); colormap('gray');title('Image5 Systole Binarized');
subplot(2,5,10);
imagesc(img5_dias_bin); colormap('gray');title('Image5 Diastole Binarized');

%% ================== 5. Labels para todos (como antes) ==============
label1_sys  = bwlabel(img1_sys_bin);
label2_sys  = bwlabel(img2_sys_bin);
label3_sys  = bwlabel(img3_sys_bin);
label4_sys  = bwlabel(img4_sys_bin);
label5_sys  = bwlabel(img5_sys_bin);

label1_dias = bwlabel(img1_dias_bin);
label2_dias = bwlabel(img2_dias_bin);
label3_dias = bwlabel(img3_dias_bin);
label4_dias = bwlabel(img4_dias_bin);
label5_dias = bwlabel(img5_dias_bin);

%% ================== 6. Segmentación ESPECIAL para Image1 Diastole ===

BW = img1_dias_bin;                % imagen binaria de Image1 Diastole (100x100)
BW = bwareaopen(BW,50);            % elimina regiones blancas muy pequeñas (<50 px)
se = strel('disk',2);              % elemento estructurante disco de radio 2
BW = imopen(BW,se);                % apertura: erosión + dilatación (suaviza, quita puntos)
BW = imfill(BW,'holes');           % rellena agujeros dentro de cada región blanca

% Cada "regionprops" corresponde a una región blanca CONECTADA
% (un objeto/cavidad completa en la imagen binaria).
stats = regionprops(BW,'Area','Perimeter','Centroid','PixelIdxList');

mask1_dias_LV = false(size(BW));   % máscara final del ventrículo izquierdo (todo negro al inicio)

if ~isempty(stats)
    % Extraemos propiedades de TODAS las regiones conectadas
    areas = [stats.Area];          % área de cada región blanca
    per   = [stats.Perimeter];     % perímetro de cada región

    % Medida de circularidad: ~1 si la región se parece a un círculo
    circ  = 4*pi*areas ./ (per.^2 + eps);

    % Centroides (x,y) de cada región
    centroids = reshape([stats.Centroid],2,[]).';
    x_cent = centroids(:,1);
    y_cent = centroids(:,2);

    [H,W] = size(BW);

    % --- FILTRO POR ÁREA RAZONABLE ---
    % Nos quedamos sólo con regiones suficientemente grandes
    % (candidatas a cavidad ventricular).
    areaMin = 200;
    cand = find(areas >= areaMin); % índices de regiones candidatas
    if isempty(cand)
        cand = 1:numel(areas);     % si ninguna pasa el filtro, usamos todas
    end

    % --- PRIORIZAR ZONA INFERIOR DERECHA ---
    % En esta imagen sabemos que el VI está abajo y a la derecha.
    maskBR = (x_cent(cand) > 0.5*W) & (y_cent(cand) > 0.5*H);

    if any(maskBR)
        % Candidatas que están en la zona "bottom-right"
        candBR = cand(maskBR);
        circBR = circ(candBR);

        % Entre ellas elegimos la más circular (mejor forma de cavidad)
        [~,idxLocal] = max(circBR);
        idx = candBR(idxLocal);
    else
        % Si ninguna región grande está en esa zona,
        % Plan B: tomar la región candidata que esté más abajo en la imagen.
        [~,idxLocal] = max(y_cent(cand));
        idx = cand(idxLocal);
    end

    % Construimos la máscara final:
    % ponemos a 1 sólo los píxeles de la región elegida (el VI)
    mask1_dias_LV(stats(idx).PixelIdxList) = true;
end


%% ================== 7. Figura de REGIONES ===========================
figure;

% --- Sístole: igual que antes ---
subplot(2,5,1);
imagesc(label1_sys ==13); colormap('gray'); title('Regions Image1 Sys');

subplot(2,5,2);
imagesc(label2_sys ==14); colormap('gray'); title('Regions Image2 Sys');

subplot(2,5,3);
imagesc(label3_sys ==14); colormap('gray'); title('Regions Image3 Sys');

subplot(2,5,4);
imagesc(label4_sys ==13); colormap('gray'); title('Regions Image4 Sys');

subplot(2,5,5);
imagesc(label5_sys ==15); colormap('gray'); title('Regions Image5 Sys');

% --- Diástole ---
% Image1: usamos la máscara especial (no el label1_dias==13)
subplot(2,5,6);
imagesc(mask1_dias_LV); colormap('gray'); title('Regions Image1 Dias');

% Las otras diástoles quedan como las tenías que ya funcionaban
subplot(2,5,7);
imagesc(label2_dias ==18); colormap('gray'); title('Regions Image2 Dias');

subplot(2,5,8);
imagesc(label3_dias ==18); colormap('gray'); title('Regions Image3 Dias');

subplot(2,5,9);
imagesc(label4_dias ==18); colormap('gray'); title('Regions Image4 Dias');

subplot(2,5,10);
imagesc(label5_dias ==13); colormap('gray'); title('Regions Image5 Dias');
