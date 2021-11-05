% rescales the data to 1 so that 99.5% of the original data is not clipped on the low end,
% and %99.5 of the data is not clipped on the high end. The effect of outliers on scaling is suppressed.
function img_out = normalise_by_histogram(img_in)
    std_within = 0.995; 
    [aa, val] = hist(abs(img_in(:)), linspace(min(abs(img_in(:))),max(abs(img_in(:))),1000));
    old_min_intensity = val(find(cumsum(aa)/sum(aa) > 1-std_within,1,'first'));
    old_max_intensity = val(find(cumsum(aa)/sum(aa) >   std_within,1,'first'));
    new_min_intensity = 0;
    new_max_intensity = 1; % max uint16
    
    img_out = tools.map(img_in, old_min_intensity, old_max_intensity, new_min_intensity, new_max_intensity);
    img_out = tools.constrain(img_out, new_min_intensity, new_max_intensity);
    img_out = img_out;
end