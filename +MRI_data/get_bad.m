function data = get_bad(slice_number, channel_number)
    data = MRI_data.get_data(slice_number, channel_number, 'bad');
end