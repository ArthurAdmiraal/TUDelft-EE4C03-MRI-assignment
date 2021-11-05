function img = to_imspace(raw)
    img = ifftshift(ifft2(squeeze(raw)),1);
end