function flow = FU7(im,Sed)

m = double(rgb2gray(im));
[height,width] = size(m);

disp('building graph');
N = height*width;

% construct graph
E = edges4connected(height,width);
V = abs(m(E(:,1))-m(E(:,2)))+eps;
A = sparse(E(:,1),E(:,2),V,N,N,4*N);

% terminal weights
% connect source to leftmost column.
% connect rightmost column to target.
Sed = sparse([1:height;N-height+1:N]',[ones(height,1);ones(height,1)*2],ones(2*height,1)*9e9);

disp('calculating maximum flow');

[flow,labels] = maxflow(A,Sed);
labels = reshape(labels,[height width]);

imagesc(labels); title('labels');

