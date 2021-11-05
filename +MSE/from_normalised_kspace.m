function MSE = from_normalised_kspace(to_test, reference)
    reference = reference / sum(abs(reference)(:).^2);
    to_test   = to_test   / sum(abs(to_test)(:).^2);
    MSE = sqrt(sum(abs(reference - to_test)(:).^2)) / prod(size(to_test));
end