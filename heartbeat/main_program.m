fileID = fopen('../Arry_data2.txt','r');
formatSpec = '%f';
sizeA = [1 Inf];
A=fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A=A/max(A);

[d1,d2]=diff_signal(A(1:200000));
Heart_beat=0;
a=[];
Fs=360;
for i=2:length(d1)-1
    if((d1(i-1)<d1(i))&&((d1(i)>d1(i+1))&&(d1(i)>(0.6*max(d1)))))
        t(Heart_beat+1)=i;
        a(i)=1;     %ploting purpose
        Heart_beat=Heart_beat+1;
        hbpm(Heart_beat)=(Heart_beat/(i/Fs))*60; 
     end
end

for i=2:Heart_beat
   ts(i-1)=t(i)-t(i-1); 
    
end
ts=ts/(360);

plot(A(1:200000),'b')
hold on
plot(a,'g')

figure
plot(d1/22,'b')
hold on
plot(a,'g')

position=find(a==1);
beat(1)=position(1);
c=2;
for i=2:length(position)
    difference=position(i)-position(i-1);
    if(difference>80)
       beat(c)=position(i);
       c=c+1;
    end
end

ts=[0,ts];
time=floor(t/360);


