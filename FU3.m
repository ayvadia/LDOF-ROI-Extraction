function [ X ] = FU3( ca )
%FU3 Works ot the contrast x-e feature vector 
%   Input       -   Cell Array with broken up image blocks
%   Processing  -   Work out the Contrast & Energy for each block and
%   stores  it in an array. Displays the cell aray ca this is to reduce
%   redundancy and should be in the previous FU to be technically correct.
%   Output      -   X(2xn) Contrast Energy Feature Vector 
%                   n is the number of blocks in the cell array ca
plotIndex = 1;
numPlotsR = size(ca, 1);
numPlotsC = size(ca, 2);
X = zeros((numPlotsR*numPlotsC),2);
figure(3),imshow([],[]), title('XE'); drawnow;
for r = 1 : numPlotsR
    for c = 1 : numPlotsC
        %fprintf('plotindex = %d,   c=%d, r=%d\n', plotIndex, c, r);
        % Specify the location for display of the image. For testing
        subplot(numPlotsR, numPlotsC, plotIndex);
        currentBlock = ca{r,c};
        imshow(currentBlock);
        [rowsB, columnsB, ~] = size(currentBlock);
%         Make the caption the block number.
        caption = sprintf('Block #%d of %d\n%d rows by %d columns', ...
        plotIndex, numPlotsR*numPlotsC, rowsB, columnsB);
        title(caption);drawnow;    
        
        blockMaxInt=double(max(currentBlock(:)));
        blockMinInt=double(min(currentBlock(:)));
        blockDynamicRange=double(double((blockMaxInt-blockMinInt))/double((blockMaxInt+blockMinInt)));
        %[a,d] = haart(currentBlock,1);    
        [~,LH,HL,HH] = dwt2(currentBlock,'haar');  

        LHA= ((1/4)*(sum(sum(LH.^2))))^(1/2);
        HLA= ((1/4)*(sum(sum(HL.^2))))^(1/2);
        HHA= ((1/4)*(sum(sum(HH.^2))))^(1/2);

        blockEnergy = min((LHA),(HLA));
        blockEnergy= min(blockEnergy,(HHA));
        %figure; imshow(currentBlock);
        X(plotIndex,2) = blockDynamicRange;
        X(plotIndex,1) = blockEnergy;

        plotIndex = plotIndex + 1;
        
    end
end
X(:,1)= X(:,1)/max(X(:,1));
X(isnan(X)) = 0 ;
end