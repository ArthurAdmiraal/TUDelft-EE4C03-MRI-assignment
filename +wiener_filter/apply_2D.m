function filtered_data = apply_2D(w_2D, bad_data)
    side_length                                        = (size(w_2D)(1)-1)/2;
    filtered_data                                      = conv2(bad_data,w_2D);
    filtered_data(1:end-side_length,1:end-side_length) = filtered_data(side_length+1:end,side_length+1:end);
    filtered_data                                      = filtered_data(1:end-2*side_length,1:end-2*side_length);
end