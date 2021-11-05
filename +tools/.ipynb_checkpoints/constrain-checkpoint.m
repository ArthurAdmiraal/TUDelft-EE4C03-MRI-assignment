function constrained_value = constrain(value, low, high)
    constrained_value                              = value;
    constrained_value(abs(constrained_value)<low)  = low;
    constrained_value(abs(constrained_value)>high) = high;
end