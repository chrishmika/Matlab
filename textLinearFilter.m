I = imread('./images/lenna.png');
F = ones(3,3);
J = linearFilter(I,F);

h1 = histogram(rgb2gray(I));
h2 = histogram(J);


subplot(2,2,1);imshow(rgb2gray(I)); hold on;
subplot(2,2,2);imshow(J);hold on;
subplot(2,2,3);plot(h1);hold on;
subplot(2,2,4);plot(h2);hold on;