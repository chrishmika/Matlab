function I = downSample(I)
if length(size(I)) == 3
    I = rgb2gray(I);
end

[M,N] = size(I);
I = I(1:2:M ,1:2:N);