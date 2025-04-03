function h = histogram(i)
if length(size(i))==3
    i = rgb2gray(i);
end
h = zeros(1,256);
[row,col] = size(i);

for x = 1:row
    for y = 1:col
        a= i(x,y);
        h(a+1) = h(a+1)+1;
    end
end


