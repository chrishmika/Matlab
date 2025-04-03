function I = brightness(I,c)
if length(size(I))==3
    I = rgb2gray(I);
end
[row,col] = size(I);
for x=1:row
    for y = 1:col
        a=I(x,y);
        a=a+c;
        if(a<0)
            a=0;
        end
        if(a > 255)
            a=255;
        end
        I(x,y)=a;
    end
end