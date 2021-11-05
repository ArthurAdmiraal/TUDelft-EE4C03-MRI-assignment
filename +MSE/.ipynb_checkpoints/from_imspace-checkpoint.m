function MSE = from_normalised_imspace(to_test, reference)
    img_to_test   = MRI_image.crop_to_interesting(abs(MRI_image.to_imspace(to_test)));
    img_reference = MRI_image.crop_to_interesting(abs(MRI_image.to_imspace(reference)));
    MSE = sqrt(sum(abs(img_reference - img_to_test)(:).^2) / prod(size(img_to_test)));
end