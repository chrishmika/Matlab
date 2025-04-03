I = imread('./images/lenna.png');
j = equalizedImg(I);

h1 = histogram(rgb2gray(I));
h2 = histogram(j);

subplot(2,2,1);imshow(rgb2gray(I)); hold on;
subplot(2,2,2);imshow(j);hold on;
subplot(2,2,3);plot(h1);hold on;
subplot(2,2,4);plot(h2);hold on;