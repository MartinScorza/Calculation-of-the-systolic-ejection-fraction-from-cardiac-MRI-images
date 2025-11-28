%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FIORITI Federico
%%% MAZZANTE Lorenzo
%%% SCORZA Martín
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

addpath(genpath(pwd));

img1_sys = dicomread('IM-0009-0020.dcm');
whos img1_sys;     
img1_dias = dicomread('IM-0009-0028.dcm');
whos img1_dias;     
img2_sys = dicomread('IM-0009-0040.dcm');
whos img2_sys;     
img2_dias = dicomread('IM-0009-0048.dcm');
whos img2_dias;     
img3_sys = dicomread('IM-0009-0060.dcm');
whos img3_sys;     
img3_dias = dicomread('IM-0009-0068.dcm');
whos img3_dias;     
img4_sys = dicomread('IM-0009-0080.dcm');
whos img4_sys;     
img4_dias = dicomread('IM-0009-0088.dcm');
whos img4_dias;     
img5_sys = dicomread('IM-0009-0100.dcm');
whos img5_sys;     
img5_dias = dicomread('IM-0009-0108.dcm');
whos img5_dias;     


%% Plot original images
figure;
subplot(2,5,1);
imagesc(img1_dias); colormap('gray'); title('Image1 Systole Original');
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

%% Plot reduced images
idx1 = 70;
idx2 = 170;
img1_sys_carre = img1_sys(idx1:idx2,idx1:idx2);
img2_sys_carre = img2_sys(idx1:idx2,idx1:idx2);
img3_sys_carre = img3_sys(idx1:idx2,idx1:idx2);
img4_sys_carre = img4_sys(idx1:idx2,idx1:idx2);
img5_sys_carre = img5_sys(idx1:idx2,idx1:idx2);
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