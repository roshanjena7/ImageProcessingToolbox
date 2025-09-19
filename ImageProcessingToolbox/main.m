function main()
    % Simple MATLAB GUI for Image Processing
    fig = uifigure('Name','Image Processing Toolbox','Position',[100 100 600 400]);

    % Load Image Button
    btnLoad = uibutton(fig,'push','Text','Load Image',...
        'Position',[20 350 100 30],'ButtonPushedFcn',@(btn,event) loadImage());

    % Axes for Display
    ax = uiaxes(fig,'Position',[150 80 400 300]);
    title(ax,'No Image Loaded');
    axis(ax,'off');

    % Store data
    data.img = [];
    guidata(fig,data);

    % Dropdown for operations
    dd = uidropdown(fig,...
        'Items',{'Grayscale','Edge Detection','Histogram Equalization','Smooth Filter','Sharpen Filter'},...
        'Position',[20 300 120 30],...
        'ValueChangedFcn',@(dd,event) applyOperation(fig,ax));

    function loadImage()
        [file,path] = uigetfile({'*.jpg;*.png;*.bmp'});
        if isequal(file,0), return; end
        img = imread(fullfile(path,file));
        data = guidata(fig);
        data.img = img;
        guidata(fig,data);
        imshow(img,'Parent',ax);
        title(ax,'Original Image');
    end

    function applyOperation(fig,ax)
        data = guidata(fig);
        if isempty(data.img), return; end
        choice = dd.Value;
        switch choice
            case 'Grayscale'
                out = convert_grayscale(data.img);
            case 'Edge Detection'
                out = detect_edges(data.img);
            case 'Histogram Equalization'
                out = histogram_equalization(data.img);
            case 'Smooth Filter'
                out = smooth_filter(data.img);
            case 'Sharpen Filter'
                out = sharpen_filter(data.img);
        end
        imshow(out,'Parent',ax);
        title(ax,choice);
    end
end
