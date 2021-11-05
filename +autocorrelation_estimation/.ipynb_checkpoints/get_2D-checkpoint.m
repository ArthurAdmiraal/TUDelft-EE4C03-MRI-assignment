function [R, lag_y, lag_x] = get_2D(data_3D, xmin, xmax, ymin, ymax, segment_length, maxlag)
    windowed_data = data_3D(ymin:ymax, xmin:xmax, :);
    
    data_width  = xmax + 1 - xmin;
    data_height = ymax + 1 - ymin;
    
    x_segment_num = floor(data_width  / segment_length);
    y_segment_num = floor(data_height / segment_length);
    slice_num     = 8;
    iter_idx      = 0;
    max_iter      = slice_num * x_segment_num * y_segment_num;
    
    segment_data = windowed_data(1:segment_length, 1:segment_length, 1);
    [R, lag_y, lag_x] = autocorrelation_estimation._acorr_2D(segment_data, maxlag);
    
    Rtotal = zeros(size(R));
    
    for slice = 1:slice_num         % repeat for every slice
    for segment_x = 1:x_segment_num % repeat for every segment
    for segment_y = 1:y_segment_num % repeat for every row
        segment_data = windowed_data(((segment_y-1)*segment_length+1):(segment_y*segment_length),
                                     ((segment_x-1)*segment_length+1):(segment_x*segment_length),
                                     slice);
        [R, lag_y, lag_x] = autocorrelation_estimation._acorr_2D(segment_data, maxlag);
        R = R ./ (segment_length-abs(lag_y));
        R = R ./ (segment_length-abs(lag_x));
        Rtotal = Rtotal + R;
        iter_idx += 1;
        printf("Iteration %d/%d      \r", iter_idx, max_iter)
    end
    end
    end
    
    R     = Rtotal / (slice_num * x_segment_num * y_segment_num);
    lag_y = lag_y;
    lag_x = lag_x;
end