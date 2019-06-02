function [K, C, Labels] = getBestCP( I, visualize )
%get the best number of colors for the color palette
%Input:
%I: input image double (0-1)
%visualize: flag for visualization (1=yes "default", 0=no)
%Output:
%K: number of best colors per palette 
%C: best color palette
%Labels: labeled pixels to know the pixels associated with each color in C

I = imresize(I,[400,400]);
if nargin==1
    visualize=1;
end

N =  round(sum(sum(getGradient(I))));
[L,NumLabels] = superpixels(I,N);
%outputImage = zeros(size(I),'like',I);
idx = label2idx(L);
numRows = size(I,1);
numCols = size(I,2);
C_initial = zeros(NumLabels,3);
for labelVal = 1:NumLabels
    redIdx = idx{labelVal};
    greenIdx = idx{labelVal}+numRows*numCols;
    blueIdx = idx{labelVal}+2*numRows*numCols;
    %outputImage(redIdx) = mean(I(redIdx));
    %outputImage(greenIdx) = mean(I(greenIdx));
    %outputImage(blueIdx) = mean(I(blueIdx));
    C_initial(labelVal,:) = [mean(I(redIdx)), mean(I(greenIdx)), mean(I(blueIdx))];
end

[IDs, ~]= DBSCAN(rgb2lab(C_initial),6,2);
K = max(unique(IDs))+1;
sigma=40; %sigma
[C, Labels] = extract_theme(I, K, sigma,1); %get color palette
%K = size(C,1);
if visualize==1 %if you need to visualize the color palette
for c=1:K
    palette1(1:50,1+((c-1)*300/K):(c*300/K)+1,1)=C(c,1);
    palette1(1:50,1+((c-1)*300/K):(c*300/K)+1,2)=C(c,2);
    palette1(1:50,1+((c-1)*300/K):(c*300/K)+1,3)=C(c,3);
end

subplot(2,1,1);
imshow(O);
title('Original image');
subplot(2,1,2);
imshow(palette1);
title('Recommended Color Palette');
end
end