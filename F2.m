function [  labels ,flow] = F2(F,B,im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%Calculate graph for rgb layers seperately and then add them together
SE=strel('cube',32);
F = imerode(F,SE); 
B = imerode(B,SE);
figure(1),imshow(F,[]), title('F'); drawnow;
figure(2),imshow(B,[]), title('B'); drawnow;
figure(3),imshow(B,[]), title('Graph Cut'); drawnow;
im = double(im);

[height,width] = size(im);
B = imdilate(B,SE); 
N = height*width;

disp('building graph');
B = B(:);% Splice Arrays
F = F(:);

% construct graph
E = edges4connected(height,width);
V = abs(im(E(:,1))-im(E(:,2)))+eps;
A = sparse(E(:,1),E(:,2),V,N, N, 4*N);

% terminal weights
T = sparse([B*9e9 ,F*9.0]);
disp('calculating maximum flow');

[flow,labels] = maxflow(A,T);% Calculate the graph cut

%reconstruct the image from the graph
labels = reshape(labels,[height width]);

imagesc(labels); title('labels');
end

