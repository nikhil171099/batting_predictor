function a = accuracy(y,p)
a=0;
m = length(y);
for i = 1:m
    if y(i) == p(i)
        a= a+1;
    end
end
a=100*a/m;