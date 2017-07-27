function [img,rot,imgC] = FU1( imgName )
%FU1 Pre-Processing
%   Gets the ball rolling for the next functional unit..
   %
%   Input       -   imgName An image with a region of interest that needs
%   to be extracted can be RGB or Grayscale, It would be pointless to
%   process a logical Image
%   Output      -   IMG   An image grayscale image rotated such that the longer edge is the width  
%                   ROT   Parameter specifying if the image has been rotated 
%   Processing  -   Check if the image is the right size Draw inputted iage


img = imread(imgName);
imgC = img;
img = rgb2gray(img);

figure(1),imshow(imgC,[]), title('Input Image'); drawnow;
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
drawnow;
%Make sure image is greater than size 24*24

[rows, columns] = size(img);
if(rows<32 || columns <32||islogical(img))
    error('The input image is too small or is logical, please try again with a more detailed image');
    %disp('<a href="matlab:dbquit;">Yes</a> / <a href="matlab:dbcont;">No</a>');
    %hlt;
end

if (rows>columns)
    rot=true;
    img=imrotate(img , -90);
else
    rot=0;
end
figure(2),imshow(img,[]), title('Grey Scale'); drawnow;
end

