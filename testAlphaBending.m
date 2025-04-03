IBG = imread('./images/sky.png');
IFG = imread('./images/plane.jpg');
new = testAlphaBending(IBG,IFG,0.6);

subplot(1,3,1);imshow(rgb2gray(IBG)); hold on;
subplot(1,3,2);imshow(rgb2gray(IFG)); hold on;
subplot(1,3,3);

