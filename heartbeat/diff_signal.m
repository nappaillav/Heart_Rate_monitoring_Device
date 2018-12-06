function [d1,d2]=diff_signal(signal)

for i=2:length(signal)
   d1(i-1)=(signal(i)-signal(i-1))*360;
   
end
for i=2:length(d1)
   d2(i-1)=d1(i)-d1(i-1); 
end


end