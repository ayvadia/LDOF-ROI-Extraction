function [ maskedRgbImage] = FU9(imgL,img_colour,rot)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

%imgL = imread('trainmask_1.bmp');
%rot = false;
%imgL = im2bw(imgL, 0.5);% Just in case
if (rot==true)
    imgL=imrotate(imgL, 90);
end
%img_colour = imread('train_1.jpg'); %loads colour image into img_colour

maskedRgbImage = bsxfun(@times, img_colour, cast(imgL,class(img_colour)));
figure(18),imshow(maskedRgbImage,[]), title('Output [Colour]'); drawnow;

end

