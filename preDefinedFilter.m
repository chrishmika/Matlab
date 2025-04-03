I = imread('./images/chess.jpg');
I =rgb2gray(I);

%unsharp
H1 = fspecial('unsharp');
usm = imfilter(I,H1);

%average
H2 = fspecial('average');
avm = imfilter(I,H2);

%gauss
H3 = fspecial('gauss');
gus = imfilter(I,H3);

%laplacian / mexicanHat
H4 = fspecial('laplacian');
lap = imfilter(I,H4);

subplot(2,3,1);imshow(I); hold on;
subplot(2,3,2);imshow(usm);hold on;
subplot(2,3,3);imshow(avm);hold on;
subplot(2,3,4);imshow(gus);hold on;
subplot(2,3,5);imshow(lap);


figure;subplot(2,3,2);imshow(H1);hold on;
subplot(2,3,3);imshow(H2);hold on;
subplot(2,3,4);imshow(H3);hold on;
subplot(2,3,5);imshow(H4);