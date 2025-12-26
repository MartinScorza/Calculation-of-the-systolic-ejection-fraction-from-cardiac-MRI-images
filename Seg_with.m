%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Segmentation with imfindcircles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
[centers_1s,radii_1s] = imfindcircles(img1_sys_bin,[15 50]);
imshow(img1_sys_bin)
hold on
viscircles(centers_1s, radii_1s,'EdgeColor','b');

%%
[centers_2s,radii_2s] = imfindcircles(img2_sys_bin,[15 50]);
imshow(img2_sys_bin)
hold on
viscircles(centers_2s, radii_2s,'EdgeColor','b');

%%
[centers_3s,radii_3s] = imfindcircles(img3_sys_bin,[15 50]);
imshow(img3_sys_bin)
hold on
viscircles(centers_3s, radii_3s,'EdgeColor','b');

%%
[centers_4s,radii_4s] = imfindcircles(img4_sys_bin,[15 30]);
imshow(img4_sys_bin)
hold on
viscircles(centers_4s, radii_4s,'EdgeColor','b');

%%
[centers_5s,radii_5s] = imfindcircles(img5_sys_bin,[15 30]);
imshow(img5_sys_bin)
hold on
viscircles(centers_5s, radii_5s,'EdgeColor','b');

%% rara
[centers_1d,radii_1d] = imfindcircles(img1_dias_bin,[7 15]);
imshow(img1_dias_bin)
hold on
viscircles(centers_1d, radii_1d,'EdgeColor','b');

%%
[centers_2d,radii_2d] = imfindcircles(img2_dias_bin,[7 16]);
imshow(img2_dias_bin)
hold on
viscircles(centers_2d, radii_2d,'EdgeColor','b');

%% rara
[centers_3d,radii_3d] = imfindcircles(img3_dias_bin,[6 20]);
imshow(img3_dias_bin)
hold on
viscircles(centers_3d, radii_3d,'EdgeColor','b');

%% rara
[centers_4d,radii_4d] = imfindcircles(img4_dias_bin,[5 20]);
imshow(img4_dias_bin)
hold on
viscircles(centers_4d, radii_4d,'EdgeColor','b');

%%
[centers_5d,radii_5d] = imfindcircles(img5_dias_bin,[7 16]);
imshow(img5_dias_bin)
hold on
viscircles(centers_5d, radii_5d,'EdgeColor','b');