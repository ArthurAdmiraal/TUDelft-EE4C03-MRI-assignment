function make_wide_image(n, hw)
    screensize = get(0,"screensize");
    screensize(end) = screensize(end-1)*hw;
    figure(n, "position",screensize)
end