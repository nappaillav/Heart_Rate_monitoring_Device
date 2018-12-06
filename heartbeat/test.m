Heart_beat=0;
a=[];
signal=Orig_Sig(1:3600);
for i=2:length(signal)-1
    if((signal(i-1)<signal(i))&&((signal(i)>signal(i+1))&&(signal(i)>(0.84))))
        t(Heart_beat+1)=i;
        a(i)=1;     %ploting purpose
        Heart_beat=Heart_beat+1;
        hbpm(Heart_beat)=(Heart_beat/(i/360))*60; 
        end
    end
    
    
    

for i=2:Heart_beat
   ts(i-1)=t(i)-t(i-1); 
    
end
ts=ts/360;
subplot(2,1,1)
plot(signal,'r');
subplot(2,1,2)
plot(signal,'r');
hold on
stem(a*1)

for i=2:length(signal)
   d(i-1)=(signal(i)-signal(i-1))*360;
   
end
for i=2:length(d)
   dd(i-1)=d(i)-d(i-1); 
end
figure ;subplot(2,1,1)
plot(d);
subplot(2,1,2)
plot(dd);


