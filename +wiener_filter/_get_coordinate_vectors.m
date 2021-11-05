% generate coordinate vectors
function L = _get_coordinate_vectors(side_length)
    L_1D = -side_length:side_length;
    [e1,e2] = meshgrid(L_1D, L_1D);
    L = [e1(:) e2(:)];

    % remove central y column
    L = L(any(L(:,1)~=0,2),:);
    
    % remove everyting but horizontal line
    %L = L(any(L(:,2)==0,2),:)
end