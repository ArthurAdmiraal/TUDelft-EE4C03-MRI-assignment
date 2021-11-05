function MSE = from_kspace(to_test, reference)
    MSE = sqrt(sum(abs(reference - to_test)(:).^2) / prod(size(to_test)));
end