function img_cropped = crop_to_interesting(img_full)
    crop_x      = [128 + 60 : 348 - 33]; % crop coordinates
    img_cropped = img_full(crop_x,:);
    img_cropped = reshape(squeeze(img_cropped(:,:)), [128 128]); 
end