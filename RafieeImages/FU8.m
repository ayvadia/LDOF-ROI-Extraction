function [ img ] = FU8(in)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%in = imread('trainmask_1.bmp');
%in = rgb2gray(in);
%figure(15),imshow(in,[]); drawnow;
%in = im2bw(in, 0.5);
%in = im2bw(in, 0.5);
figure(15),imshow(in,[]); drawnow;
SE=strel('diamond',1);   
img = imdilate(in,SE);  
img_blank_2_fill = imfill(img, 'holes'); 
img=imerode(img_blank_2_fill,SE); 
figure(20),imshow(img,[]); drawnow;
end

