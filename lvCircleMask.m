function [maskCircle, center, radius, metric] = lvCircleMask(imgBin, rRange, sensitivity, figureName)

    % --- Defaults (para que NUNCA quede sin asignar) ---
    [rows, cols] = size(imgBin);
    maskCircle = false(rows, cols);
    center = [NaN NaN];
    radius = NaN;
    metric = NaN;

    % --- Buscar círculos ---
    [centers, radii, metrics] = imfindcircles(imgBin, rRange, ...
        'ObjectPolarity','bright', 'Sensitivity', sensitivity);

    if isempty(centers)
        % opcional: mensaje debug
        warning("No circle found in %s (r=[%g %g], sens=%g). Returning empty mask.", ...
            figureName, rRange(1), rRange(2), sensitivity);
        return;
    end

    % Elegir el "mejor" según tu criterio (más a la derecha)
    [~, idx] = max(centers(:,1));
    metric = metrics(idx);
    center = centers(idx,:);
    radius = radii(idx);

    % Debug plot
    figure('Name', ['DEBUG - ' figureName], 'NumberTitle','off');
    imshow(imgBin, []); hold on;
    viscircles(center, radius, 'EdgeColor','b');
    title(['Círculo detectado - ' figureName]);
    hold off;

    % Construir máscara rellena
    [X, Y] = meshgrid(1:cols, 1:rows);
    maskCircle = (X - center(1)).^2 + (Y - center(2)).^2 <= radius^2;
end
