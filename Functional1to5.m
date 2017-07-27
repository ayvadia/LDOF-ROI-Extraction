clc;    % Clear the command window.
close all;  % Close all figures
clear all;  % Clear all variables
workspace;  % Make sure the workspace panel is showing.
%FU1
[img,rotate,imgC] =  FU1('train_1.jpg');

%FU2
[ca] =          FU2(img);

%FU3
[X] =           FU3(ca);

%FU4
[W,M,V,L] =     EM_GM_FU4(X,2,[],10,1,[]);

%FU5 FU6
XLabels =       Plot_GM_FU5(X,2,W,M,V);
%FU7

ca2 =ca;

for idx = 1:numel(ca2)
    if(XLabels(idx)==2||XLabels(idx)==3)
        ca2{idx} = uint8(ones(size(ca2{idx})))*255;
    end
    if(XLabels(idx)==4||XLabels(idx)==6||XLabels(idx)==10||XLabels(idx)==8)
       ca2{idx} = uint8(zeros(size(ca2{idx})))*255;
    end
end

% mask = false(size(img)); 
% mask(170,70) = true;
out = cell2mat(ca2);
% out=logical(out);
 figure(17),imshow(out,[]), title('out'); drawnow;
 %file = strcat('em_',file);
% fgm = imsegfmm(out,mask,0.1);
% figure(18),imshow(fgm,[]), title('FGM]'); drawnow;