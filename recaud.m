function y = recaud(n)
    for i = 1:n
        audio = audiorecorder(8000, 16, 1);
        disp('Start Speaking...');
        recordblocking(audio,2);
        fprintf('End of Recording. Database created\n');
        sig_n = getaudiodata(audio);
        str1 = num2str(i-1);
        str2 = '.wav';
        name = strcat(str1, str2);
        audiowrite(name, sig_n, 8000)
    end
end