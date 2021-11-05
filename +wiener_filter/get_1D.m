function w = get_1D(side_length, r_v, lag_v, r_x, lag_x)
length_v = length(r_v);
length_x = length(r_x);
result_length = min([length_v, length_x]);

side_offset = (result_length-1)/2;

center_v = 1+(length_v-1)/2;
center_x = 1+(length_x-1)/2;

lag = lag_v(center_v-side_offset:center_v+side_offset);
r_v = r_v(center_v-side_offset:center_v+side_offset);
r_x = r_x(center_x-side_offset:center_x+side_offset);
r_v = (zeros(1,size(r_v)) + r_v(lag==0) * double(lag==0))';
r_d = r_x - r_v;

indices_x  = lag>=0 & lag<=2*side_length;
lags_x     = lag(lag>=0 & lag<=2*side_length);
indices_x_matrix = lags_x != side_length;
indices_dx = lag>=-side_length & lag<=side_length & lag!=0;
R_x  = toeplitz(r_x(indices_x)');
R_x  = R_x(indices_x_matrix,indices_x_matrix);
r_dx = r_d(indices_dx);
lags = lag(indices_dx);
w = (R_x\r_dx).';
w = [w(1:side_length) 0 w(side_length+1:end)]; % add zero gap index for compatability with filter function
end