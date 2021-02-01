clear all;

I = imread('NoisyImage.png');
figure;imshow(I);

Z = I;
[row,column] = size(I);

for x = 2 : row-1
        for y = 2 : column-1
            median = [I(x-1,y-1),I(x-1,y),I(x,y-1),I(x+1,y+1),I(x,y),I(x-1,y+1),I(x+1,y-1),I(x+1,y),I(x,y+1)];
            median = sort(median);
            Z(x,y) = median(5);
        end
end
imwrite(Z,'EnhancedImage.png');
subplot(131);imshow(I);title('original image');
subplot(132);imshow(Z);title('Enhanced image');            
figure;imshow(Z);title('Enhanced Image');