function big = PadToOriginal(mask_small, idx1, idx2, originalSize)
    big = zeros(originalSize);
    big(idx1:idx2, idx1:idx2) = mask_small;
end


