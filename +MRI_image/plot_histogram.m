function plot_histogram(img_in)
    [aa, val] = hist(abs(img_in(:)), linspace(min(abs(img_in(:))),max(abs(img_in(:))),1000));
    std_within = 0.995; 
    xmin = val(find(cumsum(aa)/sum(aa) > 1-std_within,1,'first'));
    xmax = val(find(cumsum(aa)/sum(aa) >   std_within,1,'first'));
    semilogy(abs(val), tools.constrain(abs(aa),1e0,1e9));
    axis([xmin,xmax])
end