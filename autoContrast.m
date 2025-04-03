function I = autoContrast(I)

if length(size(I))==3
    I = rgb2gray(I);
end

[row,col] = size(I);
k = 256;

amin = 0;
amax = k-1;
alow = min(min(I));
ahigh = max(max(I));

for x =1:row
    for y= 1:col
        I(x,y) = amin+(I(x,y)-alow)*((amax-amin)/(ahigh-alow));
    end
end
        