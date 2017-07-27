function [ im,F,B,groundMask ] = read( num)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
num = num2str(num);
im = imread(strcat(num,'_C.jpg'));
F = imread(strcat(num,'_F.jpg'));
B = imread(strcat(num,'_B.jpg'));
groundMask = im2bw(imread(strcat(num,'_Mask.jpg')),0.5);
B = (im2bw(B,0.5));
F = (im2bw(F,0.5));
% im = imread('9_C.jpg');
% F = imread('9_F.jpg');
% B = imread('9_B.jpg');
% groundMask = im2bw(imread('9_Mask.jpg'),0.5);

end

