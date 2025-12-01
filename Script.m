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

%% ================== 2. Plot zone of interest =============================
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

%% ================== 4. Binarization ================================
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

se5 = strel('disk', 5);
imerosiondiast1=imopen(img1_dias_bin, se5);

figure;
subplot(3,5,1);
imagesc(img1_sys_bin); colormap('gray'); title('Image1 Systole Binarized');
subplot(3,5,6);
imagesc(img1_dias_bin); colormap('gray');title('Image1 Diastole Binarized');
subplot(3,5,2);
imagesc(img2_sys_bin); colormap('gray');title('Image2 Systole Binarized');
subplot(3,5,7);
imagesc(img2_dias_bin); colormap('gray');title('Image2 Diastole Binarized');

subplot(3,5,3);
imagesc(img3_sys_bin); colormap('gray');title('Image3 Systole Binarized');
subplot(3,5,8);
imagesc(img3_dias_bin); colormap('gray');title('Image3 Diastole Binarized');

subplot(3,5,4);
imagesc(img4_sys_bin); colormap('gray');title('Image4 Systole Binarized');
subplot(3,5,9);
imagesc(img4_dias_bin); colormap('gray');title('Image4 Diastole Binarized');

subplot(3,5,5);
imagesc(img5_sys_bin); colormap('gray');title('Image5 Systole Binarized');
subplot(3,5,10);
imagesc(img5_dias_bin); colormap('gray');title('Image5 Diastole Binarized');
subplot(3,5,11);
imagesc(imerosiondiast1); colormap('gray');title('Image1 Diastole Binarized erosed');

%% ================== 5. Labels to separe the regions =============

label1_sys  = bwlabel(img1_sys_bin) == 13;
label2_sys  = bwlabel(img2_sys_bin) == 14;
label3_sys  = bwlabel(img3_sys_bin) == 14;
label4_sys  = bwlabel(img4_sys_bin) == 13;
label5_sys  = bwlabel(img5_sys_bin) == 15;

%llabel1_dias = bwlabel(img1_dias_bin);
label1_dias = bwlabel(imerosiondiast1)== 3;
label2_dias = bwlabel(img2_dias_bin) == 18;
label3_dias = bwlabel(img3_dias_bin) == 18;
label4_dias = bwlabel(img4_dias_bin) == 18;
label5_dias = bwlabel(img5_dias_bin) == 13;


%% ================== 6. Plot regions ===========================
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

%% ================== 8. Dilatation et Erosion ===========================


n = 5;
SE = strel('sphere', n);

label1_sys_op  = imclose(label1_sys,SE);
label2_sys_op  = imclose(label2_sys,SE);
label3_sys_op  = imclose(label3_sys,SE);
label4_sys_op  = imclose(label4_sys,SE);
label5_sys_op  = imclose(label5_sys,SE);

label1_dias_op  = imclose(label1_dias,SE);
label2_dias_op  = imclose(label2_dias,SE);
label3_dias_op  = imclose(label3_dias,SE);
label4_dias_op  = imclose(label4_dias,SE);
label5_dias_op  = imclose(label5_dias,SE);

% --- Sístole: igual que antes ---
figure;
subplot(2,5,1);
imagesc(label1_sys_op); colormap('gray'); title('Fermeture Image1 Sys');

subplot(2,5,2);
imagesc(label2_sys_op); colormap('gray'); title('Fermeture Image2 Sys');

subplot(2,5,3);
imagesc(label3_sys_op); colormap('gray'); title('Fermeture Image3 Sys');

subplot(2,5,4);
imagesc(label4_sys_op); colormap('gray'); title('Fermeture Image4 Sys');

subplot(2,5,5);
imagesc(label5_sys_op); colormap('gray'); title('Fermeture Image5 Sys');

% --- Diástole ---
subplot(2,5,6);
imagesc(label1_dias_op); colormap('gray'); title('Fermeture Image1 Dyas');

subplot(2,5,7);
imagesc(label2_dias_op); colormap('gray'); title('Fermeture Image2 Dyas');

subplot(2,5,8);
imagesc(label3_dias_op); colormap('gray'); title('Fermeture Image3 Dyas');

subplot(2,5,9);
imagesc(label4_dias_op); colormap('gray'); title('Fermeture Image4 Dyas');

subplot(2,5,10);
imagesc(label5_dias_op); colormap('gray'); title('Fermeture Image5 Dyas');


