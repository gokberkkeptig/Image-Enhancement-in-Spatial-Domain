clc;
close all;
I=imread('EncodedImage.png');

[row,column] = size(I);
nk = zeros([1 256]);
cHist = zeros([1 256]);

for x = 1 :row
    for y = 1 : column
        for i = 1:256
            if((I(x,y))== i-1)
                    nk(i) = nk(i)+1 ;
                    break;
            end
        end
    end
end

% Finding cumulative histogram 
value = 0;
for i = 1:256
    value = value + nk(i);
    cHist(i) = value;
end
% Finding Sk values 
sk= zeros([1 256]);
for i=1:256
    sk(i) = cHist(i) ;
    sk(i) = sk(i)/(row*column);
    sk(i) = round(sk(i)*255);
end
% Replace values with the values we found
Z = zeros([row column]);
for x=1:row
    for y=1:column
        for i=1:256
            if(I(x,y) ==  (i-1))
                Z(x,y) = sk(i);
                break;
            end
        end
    end
end
Z = uint8(Z);
figure;imshow(I);title('original image');
figure;imshow(Z);title('Enhanced image');


