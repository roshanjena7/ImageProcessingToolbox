function out = histogram_equalization(img)
    gray = convert_grayscale(img);
    out = histeq(gray);
end
