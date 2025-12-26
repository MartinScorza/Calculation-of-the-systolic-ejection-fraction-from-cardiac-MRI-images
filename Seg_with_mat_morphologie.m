%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Segmentation with mathematical morphologie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ================== Labels to separe the regions =============

label1_sys  = bwlabel(img1_sys_bin) == 13;
label2_sys  = bwlabel(img2_sys_bin) == 24;
label3_sys  = bwlabel(img3_sys_bin) == 24;
label4_sys  = bwlabel(img4_sys_bin) == 12;
label5_sys  = bwlabel(img5_sys_bin) == 15;

label1_dias = bwlabel(img1_dias_bin) == 18;
label2_dias = bwlabel(img2_dias_bin) == 17;
label3_dias = bwlabel(img3_dias_bin) == 27;
label4_dias = bwlabel(img4_dias_bin) == 26;
label5_dias = bwlabel(img5_dias_bin) == 20;


%% ================== Plot regions ===========================
figure;

% --- Sístole: igual que antes ---
subplot(2,5,1);
imagesc(label1_sys); colormap('gray'); title('Regions Image1 Sys');

subplot(2,5,2);
imagesc(label2_sys); colormap('gray'); title('Regions Image2 Sys');

subplot(2,5,3);
imagesc(label3_sys); colormap('gray'); title('Regions Image3 Sys');

subplot(2,5,4);
imagesc(label4_sys); colormap('gray'); title('Regions Image4 Sys');

subplot(2,5,5);
imagesc(label5_sys); colormap('gray'); title('Regions Image5 Sys');

% --- Diástole ---
subplot(2,5,6);
imagesc(label1_dias); colormap('gray'); title('Regions Image1 Dias');

subplot(2,5,7);
imagesc(label2_dias); colormap('gray'); title('Regions Image2 Dias');

subplot(2,5,8);
imagesc(label3_dias); colormap('gray'); title('Regions Image3 Dias');

subplot(2,5,9);
imagesc(label4_dias); colormap('gray'); title('Regions Image4 Dias');

subplot(2,5,10);
imagesc(label5_dias); colormap('gray'); title('Regions Image5 Dias');

%% ================== Dilatation et Erosion ===========================

SE7 = strel('sphere', 7);

label1_sys_op  = imclose(label1_sys,SE7);
label2_sys_op  = imclose(label2_sys,SE7);
label3_sys_op  = imclose(label3_sys,SE7);
label4_sys_op  = imclose(label4_sys,SE7);
label5_sys_op  = imclose(label5_sys,SE7);

label1_dias_op  = imclose(label1_dias,SE7);
label2_dias_op  = imclose(label2_dias,SE7);
label3_dias_op  = imclose(label3_dias,SE7);
label4_dias_op  = imclose(label4_dias,SE7);
label5_dias_op  = imclose(label5_dias,SE7);

SE1 = strel('disk', 1);
SE2 = strel('disk', 2);
SE4 = strel('disk', 4);
SE5 = strel('disk', 5);

label1_sys_op_d  = imdilate(label1_sys_op,SE1);
label2_sys_op_d  = imdilate(label2_sys_op,SE1);
label3_sys_op_d  = imdilate(label3_sys_op,SE1);
label4_sys_op_d  = imdilate(label4_sys_op,SE1);
label5_sys_op_d  = imdilate(label5_sys_op,SE1);

label1_dias_op_d  = imdilate(label1_dias_op,SE2);
label2_dias_op_d  = imdilate(label2_dias_op,SE4);
label3_dias_op_d  = imdilate(label3_dias_op,SE2);
label4_dias_op_d  = imdilate(label4_dias_op,SE5);
label5_dias_op_d  = imdilate(label5_dias_op,SE2);

% --- Sístole: igual que antes ---
figure;
subplot(2,5,1);
imagesc(label1_sys_op_d); colormap('gray'); title('Fermeture Image1 Sys');

subplot(2,5,2);
imagesc(label2_sys_op_d); colormap('gray'); title('Fermeture Image2 Sys');

subplot(2,5,3);
imagesc(label3_sys_op_d); colormap('gray'); title('Fermeture Image3 Sys');

subplot(2,5,4);
imagesc(label4_sys_op_d); colormap('gray'); title('Fermeture Image4 Sys');

subplot(2,5,5);
imagesc(label5_sys_op_d); colormap('gray'); title('Fermeture Image5 Sys');

% --- Diástole ---
subplot(2,5,6);
imagesc(label1_dias_op_d); colormap('gray'); title('Fermeture Image1 Dyas');

subplot(2,5,7);
imagesc(label2_dias_op_d); colormap('gray'); title('Fermeture Image2 Dyas');

subplot(2,5,8);
imagesc(label3_dias_op_d); colormap('gray'); title('Fermeture Image3 Dyas');

subplot(2,5,9);
imagesc(label4_dias_op_d); colormap('gray'); title('Fermeture Image4 Dyas');

subplot(2,5,10);
imagesc(label5_dias_op_d); colormap('gray'); title('Fermeture Image5 Dyas');

%% ================== Reshape image ===========================

originalSize = [256 256]; % tamaño original DICOM

label1_sys_big  = PadToOriginal(label1_sys_op_d,  idx1, idx2, originalSize);
label2_sys_big  = PadToOriginal(label2_sys_op_d,  idx1, idx2, originalSize);
label3_sys_big  = PadToOriginal(label3_sys_op_d,  idx1, idx2, originalSize);
label4_sys_big  = PadToOriginal(label4_sys_op_d,  idx1, idx2, originalSize);
label5_sys_big  = PadToOriginal(label5_sys_op_d,  idx1, idx2, originalSize);

label1_dias_big = PadToOriginal(label1_dias_op_d, idx1, idx2, originalSize);
label2_dias_big = PadToOriginal(label2_dias_op_d, idx1, idx2, originalSize);
label3_dias_big = PadToOriginal(label3_dias_op_d, idx1, idx2, originalSize);
label4_dias_big = PadToOriginal(label4_dias_op_d, idx1, idx2, originalSize);
label5_dias_big = PadToOriginal(label5_dias_op_d, idx1, idx2, originalSize);

% --- Sístole: igual que antes ---
figure;
subplot(2,5,1);
imagesc(label1_sys_big); colormap('gray'); title('Vol Img1Sys Estimé');

subplot(2,5,2);
imagesc(label2_sys_big); colormap('gray'); title('Vol Img2Sys Estimé');

subplot(2,5,3);
imagesc(label3_sys_big); colormap('gray'); title('Vol Img3Sys Estimé');

subplot(2,5,4);
imagesc(label4_sys_big); colormap('gray'); title('Vol Img4Sys Estimé');

subplot(2,5,5);
imagesc(label5_sys_big); colormap('gray'); title('Vol Img5Sys Estimé');

% --- Diástole ---
subplot(2,5,6);
imagesc(label1_dias_big); colormap('gray'); title('Vol Img1Dias Estimé');

subplot(2,5,7);
imagesc(label2_dias_big); colormap('gray'); title('Vol Img2Dias Estimé');

subplot(2,5,8);
imagesc(label3_dias_big); colormap('gray'); title('Vol Img3Dias Estimé');

subplot(2,5,9);
imagesc(label4_dias_big); colormap('gray'); title('Vol Img4Dias Estimé');

subplot(2,5,10);
imagesc(label5_dias_big); colormap('gray'); title('Vol Img5Dias Estimé');


%% Volumenes estimados
fprintf('Resultados usando morfología matemática \n');
fprintf('Volumen estimado (estimada) IMG 1 Sys: %g\n', sum(label1_sys_big(:)));
fprintf('Volumen estimado (estimada) IMG 2 Sys: %g\n', sum(label2_sys_big(:)));
fprintf('Volumen estimado (estimada) IMG 3 Sys: %g\n', sum(label3_sys_big(:)));
fprintf('Volumen estimado (estimada) IMG 4 Sys: %g\n', sum(label4_sys_big(:)));
fprintf('Volumen estimado (estimada) IMG 5 Sys: %g\n', sum(label5_sys_big(:)));
fprintf('Volumen estimado (estimada) IMG 1 Dias: %g\n', sum(label1_dias_big(:)));
fprintf('Volumen estimado (estimada) IMG 2 Dias: %g\n', sum(label2_dias_big(:)));
fprintf('Volumen estimado (estimada) IMG 3 Dias: %g\n', sum(label3_dias_big(:)));
fprintf('Volumen estimado (estimada) IMG 4 Dias: %g\n', sum(label4_dias_big(:)));
fprintf('Volumen estimado (estimada) IMG 5 Dias: %g\n', sum(label5_dias_big(:)));

%% Fracción de eyección estimada
fprintf('Resultados usando morfología matemática \n');
fprintf('Fraccion de eyeccion (estimada) IMG 1: %g\n', (sum(label1_sys_big(:)) - sum(label1_dias_big(:)))/sum(label1_sys_big(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 2: %g\n', (sum(label2_sys_big(:)) - sum(label2_dias_big(:)))/sum(label2_sys_big(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 3: %g\n', (sum(label3_sys_big(:)) - sum(label3_dias_big(:)))/sum(label3_sys_big(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 4: %g\n', (sum(label4_sys_big(:)) - sum(label4_dias_big(:)))/sum(label4_sys_big(:)));
fprintf('Fraccion de eyeccion (estimada) IMG 5: %g\n', (sum(label5_sys_big(:)) - sum(label5_dias_big(:)))/sum(label5_sys_big(:)));
