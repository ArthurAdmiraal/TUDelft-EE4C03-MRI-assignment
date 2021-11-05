function [R, lag_y, lag_x] = _acorr_2D(x, maxlag)
    dim = size(x)-[1,1];
    xdim = min(dim(2), maxlag);
    ydim = min(dim(1), maxlag);
    R    = zeros([ydim, xdim]);
    for i = -ydim:ydim
        for j = -xdim:xdim
            x1 = x(max(1+i,1):min(end+i,end), max(1+j,1):min(end+j,end));
            x2 = x(max(1-i,1):min(end-i,end), max(1-j,1):min(end-j,end));
            R(i+ydim+1, j+xdim+1) = sum(sum(x1 .* conj(x2)));
            lag_y(i+ydim+1, j+xdim+1) = i;
            lag_x(i+ydim+1, j+xdim+1) = j;
        end
    end
end