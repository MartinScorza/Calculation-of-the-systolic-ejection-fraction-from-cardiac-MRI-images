function [maskCircle, center, radius, metric] = lvCircleMask(imgBin, rRange, sensitivity, figureName)
    
    [centers, radii, metrics] = imfindcircles(imgBin, rRange,'ObjectPolarity','bright','Sensitivity', sensitivity);
    [rows, cols] = size(imgBin);

    if isempty(centers)
        return;
    end

    % Elegir el mejor (mayor métrica)
    [~, idx] = max(centers(:,1));  % el de mayor X (más a la derecha)
    metric = metrics(idx);
    center = centers(idx,:);   % [x y]
    radius = radii(idx);

    figure('Name', ['DEBUG - ' figureName], 'NumberTitle','off');
    imshow(imgBin, []); hold on;
    viscircles(center, radius, 'EdgeColor','b');
    title(['Círculo detectado - ' figureName]);
    hold off;
    
    % Construir máscara rellena
    [X, Y] = meshgrid(1:cols, 1:rows);
    maskCircle = (X - center(1)).^2 + (Y - center(2)).^2 <= radius^2;
end