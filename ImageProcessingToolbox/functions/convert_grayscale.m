function out = convert_grayscale(img)
    if size(img,3) == 3
        out = rgb2gray(img);
    else
        out = img;
    end
end
