function log = binaryConvert(y, runs)
m = length(y);
for i = 1:m
    if y(i)<runs
        y(i) = 0;
    else
        y(i) = 1;
    end
end
log = y;

