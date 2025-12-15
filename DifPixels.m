function pixels = DifPixels(img1,img2)

img1 = double(img1(:));
img2 = double(img2(:));

pixels = sum(abs(img1 - img2));

end

