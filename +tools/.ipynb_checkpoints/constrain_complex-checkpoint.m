function constrained_value = constrain_complex(value, low, high)
    constrained_value                              = value;
    low_values                                     = low  .* value ./ abs(value);
    high_values                                    = high .* value ./ abs(value);
    constrained_value(abs(constrained_value)<low)  = low_values(abs(constrained_value)<low);
    constrained_value(abs(constrained_value)>high) = high_values(abs(constrained_value)>high);
end