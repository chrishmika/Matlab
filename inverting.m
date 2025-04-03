function I = inverting(I)
if length(size(I))==3
    I = rgb2gray(I);
end
[row,col] = size(I);
amax = 255;
for i = 1:row
    for j= 1:col
        a=I(i,j);
        a=amax-a;
        I(i,j) = a;
    end
end


