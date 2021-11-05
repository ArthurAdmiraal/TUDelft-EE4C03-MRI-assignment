function plot_in_kspace(img_kspace)
    img = abs(img_kspace);
    img = MRI_image.normalise_by_histogram(img);
    MRI_image._plot(img)
end