function I = alphaBlending(IBG,IFG,alpha)

if length(size(IBG))==3
    IBG = rgb2gray(IBG);
end

if length(size(IFG))==3
    IFG = rgb2gray(IFG);
end

%IBG and IFG need to be of same size
[M,N] = size(IBG);

I = IBG;
for i = 1:M
    for j = 1:N
        I(i,j) = alpha*IBG(i,j)+ (1-alpha)*IFG(i,j);
    end
end