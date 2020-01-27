clc
clear all
close all

%recaud(10);

audio = audiorecorder(8000, 16, 1);
fprintf('Start Speaking..\n');
recordblocking(audio,2);
fprintf('End of Recording..\n');
x = getaudiodata(audio);
%x = silence_remove(x);
px = pow(x);
zx = zcr(x);
fx = fourier(x);
lx = lpc_find(x);

for i = 1:10
    name = sprintf('%d.wav', i-1);
    y = audioread(name);
    %y = silence_remove(y);
    
    py(i) = pow(y);
    dp(i) = euc_dis(px, py(i));
    
    zy(i) = zcr(y);
    dz(i) = euc_dis(zx, zy(i));
    
    xc(i) = cor(x, y);
    
    fy(i) = fourier(y);
    df(i) = euc_dis(fx, fy(i));
    
    ly(i) = lpc_find(y);
    dl(i) = euc_dis(lx, ly(i));
end

dp_min = min(dp);
dz_min = min(dz);
df_min = min(df);
xc_max = max(xc);
dl_min = min(dl);

n1 = find(dp == dp_min);
n2 = find(dz == dz_min);
n3 = find(df == df_min);
n4 = find(xc == xc_max);
n5 = find(dl == dl_min);

word = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];

fprintf('\nUsing signal power: ');
fprintf(word(n1));
fprintf('\nUsing ZCR: ');
fprintf(word(n2));
fprintf('\nUsing FFT: ');
fprintf(word(n3));
fprintf('\nUsing Correlation: ');
fprintf(word(n4));
fprintf('\nUsing LPC: ');
fprintf(word(n5));
fprintf('\n');