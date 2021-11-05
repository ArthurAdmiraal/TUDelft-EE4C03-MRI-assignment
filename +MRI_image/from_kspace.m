function img = from_kspace(img_kspace)
    img = abs(MRI_image.to_imspace(img_kspace));
    img = MRI_image.clear_compensate(img);
    img = MRI_image.crop_to_interesting(img);
    img = MRI_image.normalise_by_histogram(img);
end