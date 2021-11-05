function w_2D = get_2D(side_length, R_x)
    L = wiener_filter._get_coordinate_vectors(side_length);
    [R, r_dx] = wiener_filter._build_2D_wiener_hopf(side_length, R_x, L);

    w = (R\r_dx.').';

    w_2D = zeros([2*side_length+1,2*side_length+1]);

    for k_idx = 1:length(L)
        k                        = L(k_idx,:);
        index                    = k + side_length + 1;
        w_2D(index(2), index(1)) = w(k_idx);
    end
end