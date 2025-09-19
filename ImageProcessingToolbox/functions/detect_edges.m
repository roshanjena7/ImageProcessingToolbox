function out = detect_edges(img)
    gray = convert_grayscale(img);
    out = edge(gray,'canny');
end
