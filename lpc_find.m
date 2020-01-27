function y = lpc_find(x)
    y = mean(lpc(x, 16));
end