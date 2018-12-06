fileID = fopen('ECG_dat2.txt','r');
formatSpec = '%f';
sizeA = [1 Inf];
A=fscanf(fileID,formatSpec,sizeA);
fclose(fileID);



