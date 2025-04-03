fuction I = thresholding(I,tresh)
if length(size(I))==3
    I = rgb2gray(I);
end
[row,col] = size(I);
for i= 1:row
    for j = 1:col
        a=I(i,j);
        if(a <=tresh)
            a= 0;
        else
            a= 255;
        end
        I(i,j) =a;
    end
end