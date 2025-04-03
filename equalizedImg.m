function I = equalizedImg(I)

if length(size(I))==3
    I = rgb2gray(I);
end

K = 256;
[M,N] = size(I);

h = histogram(I);
H = cumulative(h);

for i = 1:M
    for j = 1:N
        a = I(i,j);
        I(i,j) = floor((H(a)*(K-1))/(M*N));
    end
end