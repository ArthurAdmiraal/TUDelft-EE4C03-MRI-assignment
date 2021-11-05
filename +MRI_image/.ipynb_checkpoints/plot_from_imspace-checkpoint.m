function plot_from_imspace(img_imspace)
    img = abs(img_imspace);
    img = MRI_image.clear_compensate(img);
    img = MRI_image.crop_to_interesting(img);
    img = MRI_image.normalise_by_histogram(img);

    imagesc(img);
    colormap('gray');
    axis('tight', 'off');
end