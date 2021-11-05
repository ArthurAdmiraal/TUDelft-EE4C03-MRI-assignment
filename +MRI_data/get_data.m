function data = get_data(slice_number, channel_number, data_type)
    data_type = [upper(data_type(1)), lower(data_type(2:end))]; % enforce capitalisation
    
    snstr = num2str(slice_number,  '%d');
    cnstr = num2str(channel_number,'%d');

    file_path = ['MRI_datasets/Slice' snstr '/' data_type 'Data/slice' snstr '_channel' cnstr '.mat'];
    data = load(file_path);
    fn = fieldnames(data);
    fn = fn{[1,1]};
    data = getfield(data, fn);
end