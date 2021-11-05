%% determine the signal autocorrelation matrix
function plot_2D(lag_x, lag_y, R)
    surf(lag_x, lag_y, abs(R))
    xlabel('x')
    ylabel('y')
    zlabel('R_x')
end