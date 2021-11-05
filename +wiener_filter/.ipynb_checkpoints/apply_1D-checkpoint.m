function filtered_data = apply_1D(w, bad_data)
    side_length = (length(w)-1)/2;
    filtered_data = filter(w,1,bad_data.').'; % ToDo: unintended conjugation
    filtered_data(:,1:end-side_length) = filtered_data(:,side_length+1:end);
end