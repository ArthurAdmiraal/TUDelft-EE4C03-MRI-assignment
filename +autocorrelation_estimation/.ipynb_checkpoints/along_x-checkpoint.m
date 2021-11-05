function [R, lag] = along_x(data_3D, xmin, xmax, ymin, ymax, segment_length)
    windowed_data = data_3D(ymin:ymax, xmin:xmax, :);
    
    data_width = xmax + 1 - xmin;
    
    segment_num = floor(data_width / segment_length);
    slice_num   = 8;
    row_num     = ymax - ymin;
    
    % quick hack to initialise Rtotal
    segment_data = windowed_data(1, 1:segment_length, 1)(:);
    [R, lag] = xcorr(segment_data);
    Rtotal = zeros(size(R));
    
    for slice   = 1:slice_num   % repeat for every slice
    for segment = 1:segment_num % repeat for every segment
    for row     = 1:row_num     % repeat for every row
        segment_data = windowed_data(row, ((segment-1)*segment_length+1):(segment*segment_length), slice)(:);
        [R, lag] = xcorr(segment_data);
        R = R ./ (segment_length - abs(lag(:)));
        Rtotal = Rtotal + R;
    end
    end
    end
    
    R   = Rtotal / (segment_num * slice_num * row_num);
    lag = lag(:);
end