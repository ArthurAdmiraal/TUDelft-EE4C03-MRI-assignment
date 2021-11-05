% 1. Slice number - different images
% 2. Channel number - different captures of same slice
% 3. X - dimension of the K-Space data    - 128
% 4. Y - dimension of the K-Space data    - 512
function slices = get_3D(type)
    for j=1:3
        for i=1:8
            % y, x, z, channel
            slices(:, :, i, j) = MRI_data.get_data(i,j,type);
        end
    end
end