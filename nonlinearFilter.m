I = imread('./images/goodpic.jpg');
if length(size(I))==3
    I = rgb2gray(I);
end

f = @(x) min(x(:));
Jmin = nlfilter(I,[3,3],f);

f = @(x) max(x(:));
Jmax = nlfilter(I,[3,3],f);

f = @(x) median(x(:));
Jmedian = nlfilter(I,[3,3],f);

%sallt and pepper noice added
I = imnoise(I,'salt & pepper');

figure;
subplot(2,2,1);imshow(I);title("added noice"); hold on;
subplot(2,2,2);imshow(Jmin);title("min");hold on;
subplot(2,2,3);imshow(Jmax);title("max");hold on;
subplot(2,2,4);imshow(Jmedian);title("median");

%figure;
%imshow(IG);title("addd noice")