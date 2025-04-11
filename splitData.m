function [trData,teData] = splitData(data)
[m,n]= size(data);

%performe random shuffel on the data
indices = randperm(m);
data= data(indices,:);

trData = [] ; teData = [];
nTr = round(m*0.7);
trDate = data(1:nTr,:);
teData = data(nTr+1:m,:);