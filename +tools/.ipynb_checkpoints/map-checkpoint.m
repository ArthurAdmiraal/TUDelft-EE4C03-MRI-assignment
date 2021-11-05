function mapped_value = map(value, fromLow, fromHigh, toLow, toHigh)
    mapped_value = toLow .+ (value.-fromLow) .* ((toHigh-toLow)/(fromHigh-fromLow));
end
