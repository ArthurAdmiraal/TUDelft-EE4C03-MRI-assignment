% determine the noise autocorrelation matrix
function [r_v, lag_v] = get_rv(type)
from_edge      = 50;

data_3D        = MRI_image.normalise_by_histogram(MRI_data.get_3D(type));
data_3D_fused  = data_3D(:,:,:,1) + data_3D(:,:,:,2) + data_3D(:,:,:,3);
data_size      = size(data_3D_fused);
xmin           = 1;
xmax           = data_size(2);
ymin           = 1;
ymax           = from_edge;
segment_length = floor((xmax + 1 - xmin) / 6);

[r1, lag_v] = autocorrelation_estimation.along_x(data_3D_fused, xmin, xmax, ymin, ymax, segment_length);

ymin           = data_size(1) + 1 - from_edge;
ymax           = data_size(1);

[r2, lag_v] = autocorrelation_estimation.along_x(data_3D_fused, xmin, xmax, ymin, ymax, segment_length);
r_v = (r1 + r2)/2;
end