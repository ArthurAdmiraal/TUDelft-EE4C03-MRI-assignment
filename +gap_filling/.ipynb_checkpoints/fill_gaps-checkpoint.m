function repaired_data = fill_gaps(bad_data, filtered_data)
    repaired_data = bad_data;

    to_repair = [6 22 38 54 70 86 102 118];
    for column_to_repair=to_repair
        repaired_data(:,column_to_repair) = filtered_data(:,column_to_repair);
    end
end