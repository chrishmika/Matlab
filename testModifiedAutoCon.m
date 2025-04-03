I = imread('./images/cameraman.jpg');
J = modifiedAutoContrast(I);
horg = histogram(I);
hmod = histogram(J);
subplot(2,2,1);imshow(rgb2gray(I)); hold on;
subplot(2,2,2);bar(horg); hold on;
subplot(2,2,3);imshow(J); hold on;
subplot(2,2,4);bar(hmod);

