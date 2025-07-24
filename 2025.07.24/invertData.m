function Data = invertData(Data,class)

%this function is used to invert thr +1 class and -1 classes

%**********Interest class**********

indices = (Data(:,end)==class);
Data(indices,end) = 1;

%**********noninterest class**********

ind = ~indices;
Data(ind,end) = -1;