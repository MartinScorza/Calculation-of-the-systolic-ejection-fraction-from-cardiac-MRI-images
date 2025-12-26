%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Segmentation with imfindcircles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


circle_1_sys  = lvCircleMask(img1_sys_bin, [15 25], 0.9, 'Img1 Sys');
circle_2_sys  = lvCircleMask(img2_sys_bin, [15 25], 0.9, 'Img2 Sys');
circle_3_sys  = lvCircleMask(img3_sys_bin, [15 25], 0.9, 'Img3 Sys');
circle_4_sys  = lvCircleMask(img4_sys_bin, [15 25], 0.9, 'Img4 Sys');
circle_5_sys  = lvCircleMask(img5_sys_bin, [15 30], 0.9, 'Img5 Sys');

circle_1_dias = lvCircleMask(img1_dias_bin, [8 18], 0.9, 'Img1 Dias');
circle_2_dias = lvCircleMask(img2_dias_bin, [7 16], 0.9, 'Img2 Dias');
circle_3_dias = lvCircleMask(img3_dias_bin, [6 20], 0.9, 'Img3 Dias');
circle_4_dias = lvCircleMask(img4_dias_bin, [5 20], 0.9, 'Img4 Dias');
circle_5_dias = lvCircleMask(img5_dias_bin, [7 16], 0.85, 'Img5 Dias');

%% 
originalSize = [256 256]; % tamaño original DICOM

idx1 = 70;
idx2 = 170;

imfindcirc1_sys  = PadToOriginal(circle_1_sys,  idx1, idx2, originalSize);
imfindcirc2_sys  = PadToOriginal(circle_2_sys,  idx1, idx2, originalSize);
imfindcirc3_sys  = PadToOriginal(circle_3_sys,  idx1, idx2, originalSize);
imfindcirc4_sys  = PadToOriginal(circle_4_sys,  idx1, idx2, originalSize);
imfindcirc5_sys  = PadToOriginal(circle_5_sys,  idx1, idx2, originalSize);
 
imfindcirc1_dias = PadToOriginal(circle_1_dias, idx1, idx2, originalSize);
imfindcirc2_dias = PadToOriginal(circle_2_dias, idx1, idx2, originalSize);
imfindcirc3_dias = PadToOriginal(circle_3_dias, idx1, idx2, originalSize);
imfindcirc4_dias = PadToOriginal(circle_4_dias, idx1, idx2, originalSize);
imfindcirc5_dias = PadToOriginal(circle_5_dias, idx1, idx2, originalSize);

figure;
subplot(2,5,1);
imagesc(imfindcirc1_sys); colormap('gray'); title('Vol Img1Sys Estimé');

subplot(2,5,2);
imagesc(imfindcirc2_sys); colormap('gray'); title('Vol Img2Sys Estimé');

subplot(2,5,3);
imagesc(imfindcirc3_sys); colormap('gray'); title('Vol Img3Sys Estimé');

subplot(2,5,4);
imagesc(imfindcirc4_sys); colormap('gray'); title('Vol Img4Sys Estimé');

subplot(2,5,5);
imagesc(imfindcirc5_sys); colormap('gray'); title('Vol Img5Sys Estimé');

subplot(2,5,6);
imagesc(imfindcirc1_dias); colormap('gray'); title('Vol Img1Dias Estimé');

subplot(2,5,7);
imagesc(imfindcirc2_dias); colormap('gray'); title('Vol Img2Dias Estimé');

subplot(2,5,8);
imagesc(imfindcirc3_dias); colormap('gray'); title('Vol Img3Dias Estimé');

subplot(2,5,9);
imagesc(imfindcirc4_dias); colormap('gray'); title('Vol Img4Dias Estimé');

subplot(2,5,10);
imagesc(imfindcirc5_dias); colormap('gray'); title('Vol Img5Dias Estimé');

%% Volumenes estimados
fprintf('Resultados usando detección de círculos (imfindcircles) \n');
fprintf('Volumen estimado (estimada) IMG 1 Sys: %g\n', sum(imfindcirc1_sys(:)));
fprintf('Volumen estimado (estimada) IMG 2 Sys: %g\n', sum(imfindcirc2_sys(:)));
fprintf('Volumen estimado (estimada) IMG 3 Sys: %g\n', sum(imfindcirc3_sys(:)));
fprintf('Volumen estimado (estimada) IMG 4 Sys: %g\n', sum(imfindcirc4_sys(:)));
fprintf('Volumen estimado (estimada) IMG 5 Sys: %g\n', sum(imfindcirc5_sys(:)));
fprintf('Volumen estimado (estimada) IMG 1 Dias: %g\n', sum(imfindcirc1_dias(:)));
fprintf('Volumen estimado (estimada) IMG 2 Dias: %g\n', sum(imfindcirc2_dias(:)));
fprintf('Volumen estimado (estimada) IMG 3 Dias: %g\n', sum(imfindcirc3_dias(:)));
fprintf('Volumen estimado (estimada) IMG 4 Dias: %g\n', sum(imfindcirc4_dias(:)));
fprintf('Volumen estimado (estimada) IMG 5 Dias: %g\n', sum(imfindcirc5_dias(:)));


%% Fracción de eyección estimada
fprintf('Resultados usando detección de círculos (imfindcircles) \n');
fprintf('Fraccion de eyeccion (estimada) IMG 1: %g\n', (sum(imfindcirc1_sys(:)) - sum(imfindcirc1_dias(:)))/sum(imfindcirc1_sys(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 2: %g\n', (sum(imfindcirc2_sys(:)) - sum(imfindcirc2_dias(:)))/sum(imfindcirc1_sys(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 3: %g\n', (sum(imfindcirc3_sys(:)) - sum(imfindcirc3_dias(:)))/sum(imfindcirc1_sys(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 4: %g\n', (sum(imfindcirc4_sys(:)) - sum(imfindcirc4_dias(:)))/sum(imfindcirc1_sys(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 5: %g\n', (sum(imfindcirc5_sys(:)) - sum(imfindcirc5_dias(:)))/sum(imfindcirc1_sys(:)));

