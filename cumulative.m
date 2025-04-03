function H = cumulative(h)

k = length(h);
H = zeros(1,k);

H(1) = h(1);
for i=2:k
    H(i) = H(i-1)+h(i);
end