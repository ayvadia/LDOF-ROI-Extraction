function [ ca ] = FU2(img)
%FU2 Breaks up the image into blocks 
%   Input       -   Image
%   Processing  -   Image is broken up
%   Output      -   Cell array with broken up image

[rows, columns] = size(img);
blockSize = ceil(columns/6);% Columns in block.
% Figure out the size of each block in rows.
% Most will be blockSize but there may be a remainder amount of less than that.
wholeBlockRows = floor(rows / blockSize);
if(rem(rows, blockSize)>1)
    blockVectorR = [blockSize * ones(1, wholeBlockRows), rem(rows, blockSize)];
else
    blockVectorR = blockSize * ones(1, wholeBlockRows);
end
% Figure out the size of each block in columns.
wholeBlockCols = floor(columns / blockSize);
if(rem(columns, blockSize)>1)
    blockVectorC = [blockSize * ones(1, wholeBlockCols), rem(columns, blockSize)];
else
    blockVectorC = blockSize * ones(1, wholeBlockCols);
end

    ca = mat2cell(img, blockVectorR, blockVectorC);
end

