function y = feature_train(x)

window_length=80;
window_shift=20;

temp_mag=[];
temp_angle=[];

x1=x./max(abs(x));
N=16;

window_number=floor(((length(x1)-(window_length+1))/window_shift)+1);
wind_start=1;
wind_end=window_number;
u=0;
for k=wind_start:wind_end
    u=u+1;
    start=((k-1)*window_shift)+1;
    c=x1(start:(start+window_length));

    A=lpc(c,N);
    [r temp, c1]=residue(1,A);
    temp_mag(u,:)=abs(temp)./max(abs(temp));
    temp_angle(u,:)=(180/pi)*angle(temp);
    if (isempty(find(temp_angle(u,:)==0, 1))==0)
        u=u-1;
    elseif(isempty(find(temp_angle(u,:)==180, 1))==0)
        u=u-1;
    else
        u=u;
    end
    for m=1:2:N
        mag_mean(1,m)=mean(temp_mag(:,m)');        
    end
    for m=1:2:N        
        angle_mean(1,m)=mean(temp_angle(:,m)')./180;        
    end    
end
    i=0;
    for m=1:2:N
      i=i+1;
      final_angle_mean1(1,i)=mean(angle_mean(:,m));
    end
final_angle_mean=final_angle_mean1;
i=0;
for m=1:2:N
    i=i+1;
    final_mag_mean(1,i)=mean(mag_mean(:,m));
end
feature_train=[final_angle_mean final_mag_mean];
y = feature_train;
end