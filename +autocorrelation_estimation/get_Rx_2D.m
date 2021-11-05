%% determine the signal autocorrelation matrix
function [R_x, lag_x_y, lag_x_x] = get_Rx_2D(max_lag)
    box_size       = 60;

    data_3D        = MRI_image.normalise_by_histogram(MRI_data.get_3D('good'));
    data_3D_fused  = data_3D(:,:,:,1) + data_3D(:,:,:,2) + data_3D(:,:,:,3);
    data_size      = size(data_3D_fused);
    xmin           = 64+1 - box_size;
    xmax           = 64   + box_size;
    ymin           = 256+1 - box_size;
    ymax           = 256   + box_size;
    segment_length = (ymax + 1 - ymin) / 3;

    [R_x, lag_x_y, lag_x_x] = autocorrelation_estimation.get_2D(data_3D_fused, xmin, xmax, ymin, ymax, segment_length, max_lag);
end