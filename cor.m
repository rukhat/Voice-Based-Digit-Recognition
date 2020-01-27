function y = cor(x1, x2)
    y = max(xcorr(x1, x2));
end