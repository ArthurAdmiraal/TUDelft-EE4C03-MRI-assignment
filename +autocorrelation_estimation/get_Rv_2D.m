%% determine the noise autocorrelation matrix
function [R_v, lag_v_y, lag_v_x] = get_Rv_2D(max_lag)
from_edge      = 50;

data_3D        = MRI_image.normalise_by_histogram(MRI_data.get_3D('good'));
data_3D_fused  = data_3D(:,:,:,1) + data_3D(:,:,:,2) + data_3D(:,:,:,3);
data_size      = size(data_3D_fused);
xmin           = 1;
xmax           = data_size(2);
ymin           = 1;
ymax           = from_edge;
segment_length = 10;

[R1, lag_v_y, lag_v_x] = autocorrelation_estimation.get_2D(data_3D_fused, xmin, xmax, ymin, ymax, segment_length, max_lag);

ymin           = data_size(1) + 1 - from_edge;
ymax           = data_size(1);

[R2, lag_v_y, lag_v_x] = autocorrelation_estimation.get_2D(data_3D_fused, xmin, xmax, ymin, ymax, segment_length, max_lag);
R_v = (R1 + R2)/2;
end