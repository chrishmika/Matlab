I = imread('./images/lenna.png');
Gauss = [2,5,2;3,5,3;2,5,2];
Box = [3,3,3;3,3,3;3,3,3;];
Laplace = [5,2,5;5,8,5;5,2,5];
J = linearFilter(I,Gauss);
K = linearFilter(I,Box);
L = linearFilter(I,Laplace);

h1 = histogram(I);
h2 = histogram(J);

figure;subplot(2,2,1);imshow(I); hold on;
subplot(2,2,2);imshow(J);title("guass");hold on;
subplot(2,2,3);imshow(K);title("box");hold on;
subplot(2,2,4);imshow(L);title("laplace");

figure;
subplot(2,2,1);imshow(I); hold on;
subplot(2,2,2);imshow(J);hold on;
subplot(2,2,3);plot(h1);hold on;
subplot(2,2,4);plot(h2);