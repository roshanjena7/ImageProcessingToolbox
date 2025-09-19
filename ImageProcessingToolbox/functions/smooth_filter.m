function out = smooth_filter(img)
    h = fspecial('average',[5 5]);
    out = imfilter(img,h);
end
