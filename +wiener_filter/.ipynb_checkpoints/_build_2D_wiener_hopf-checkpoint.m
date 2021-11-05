% build matrices
function [R, r_dx] = _build_2D_wiener_hopf(side_length, R_x, L)
    for k_idx = 1:length(L)
        k = L(k_idx,:);
        for l_idx = 1:length(L)
            l          = L(l_idx,:);
            coordinate = k-l;
            index      = coordinate + 1+(size(R_x)-1)/2;
            R(k_idx, l_idx) = R_x(index(2), index(1));
        end
        k_index = k + 1+(size(R_x)-1)/2;
        r_dx(k_idx) = R_x(k_index(2), k_index(1));
    end
end