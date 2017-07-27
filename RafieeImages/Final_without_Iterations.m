clc;
clear;
close all;

[ im,F,B,groundMask ] = read(2);

%Break up each layer
R = im(:,:,1); 
G = im(:,:,2); 
Bl = im(:,:,3); 

%  add layer masks
%Mask = F2(F,B,R)+F2(F,B,Bl)+F2(F,B,G);
Mask = F2(F,B,rgb2gray(im));
Mask = logical(mod(Mask,2));

imagesc(Mask); title('labels');
figure(4),imshow(Mask,[]), title('Mask'); drawnow;

[ img ] = FU8(Mask);

maskedRgbImage = FU9(Mask,im,false);
groundMask = groundMask>0;

[Fvalue,precision,recall,accuracy,JaccardIndex,TP,FP,TN,FN,FPrate,TPrate,MCC] = FU11(groundMask, Mask);