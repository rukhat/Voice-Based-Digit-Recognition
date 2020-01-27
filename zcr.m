function y = zcr(x)
    len = length(x);
        for i = 2:len
            s = sum(abs(x(i) - x(i-1)));
        end
    y = s / (2*len)*10^7;
end