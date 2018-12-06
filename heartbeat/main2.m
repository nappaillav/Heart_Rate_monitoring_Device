fileID = fopen('../Arry_data1.txt','r');
formatSpec = '%f';
sizeA = [1 Inf];
A=fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A=A/max(A);
A=downsample(A,8);


[d1,d2]=diff_signal(A);
Heart_beat=0;
a=[];
Fs=45;

for i=2:length(d1)-1
    if((d1(i-1)<d1(i))&&((d1(i)>d1(i+1))&&(d1(i)>(0.6*max(d1)))))
        t(Heart_beat+1)=i;
        a(i)=1;     %ploting purpose
        Heart_beat=Heart_beat+1;
        hbpm(Heart_beat)=(Heart_beat/(i/Fs))*60; 
     end
end



