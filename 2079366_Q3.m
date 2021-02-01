clear all; 

I = imread('BlurImage.png');
figure;imshow(I);

filter=[1 1 1 ; 1 -8 1 ; 1 1 1 ];

C= conv2(I,filter,'same');

o = uint8(C);

o = I - o;

imwrite(o,'EnhancedImage2.png');

subplot(131);imshow(I);title('original image');
subplot(132);imshow(o);title('Enhanced image'); 
figure;imshow(o);