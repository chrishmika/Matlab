function I = modifiedAutoContrast(I)

if length(size(I))==3
    I = rgb2gray(I);
end

[M,N] = size(I);
amin = 0;
amax = 255;
qlow = 0.005;
qhigh = qlow;

h = histogram(I);
H = cumulative(h);
a1low = min(find(H>=M*N*qlow));
a1high = max(find(H<=M*N*(1-qhigh)));

for i =1:M
    for j= 1:N
        a=I(i,j);
        if(a<=a1low)
            I(i,j) = amin;
        else if(a>=a1high)
                I(i,j) =amax;
            else
                I(i,j) = amin+(a-a1low)*((amax-amin)/(a1high-a1low));
            end
        end
    end
end
        