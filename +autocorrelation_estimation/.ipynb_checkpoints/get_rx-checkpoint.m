% Estimate combined signal and noise autocorrelation
function [r_x, lag_x] = get_rx(type)
box_size       = 60;

data_3D        = MRI_image.normalise_by_histogram(MRI_data.get_3D(type));
data_3D_fused  = data_3D(:,:,:,1) + data_3D(:,:,:,2) + data_3D(:,:,:,3);
data_size      = size(data_3D_fused);
xmin           = 64+1 - box_size;
xmax           = 64   + box_size;
ymin           = 256+1 - box_size;
ymax           = 256   + box_size;
segment_length = (xmax + 1 - xmin) / 3;

[r_x, lag_x] = autocorrelation_estimation.along_x(data_3D_fused, xmin, xmax, ymin, ymax, segment_length);
end