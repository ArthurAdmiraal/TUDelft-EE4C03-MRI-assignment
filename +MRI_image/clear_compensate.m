% clear compensation, preparation, based on fourier transformed blinked
% operates in image space
function img_out = clear_compensate(img_in)
    clear_comp   = linspace(10,0.1,size(img_in,2)).^2; 
    clear_matrix = repmat(clear_comp,[size(img_in,1) 1]);
    img_out      = clear_matrix .* img_in;
end