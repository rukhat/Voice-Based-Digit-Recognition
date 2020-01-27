function y = silence_remove(x)
    fs = 8000;
    frame_duration = 0.01;
    frame_len = frame_duration * fs;
    N = length(x); 
    num_frames = floor(N / frame_len);
    new_sig = zeros(N, 1);
    count = 0;
        for k = 1 : num_frames
            frame = x((k-1)*frame_len+1 : frame_len*k);
            max_val = max(frame);
    
            if (max_val > 0.03)
                count = count + 1;
                new_sig((count-1)*frame_len+1 : frame_len*count) = frame;
            end
        end
        
    sig_f = new_sig(new_sig ~= 0);
    q = zeros(20000, 1);
    y = sig_f;
end