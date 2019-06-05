function [K, C, Labels] = getBestCP_( I, visualize )
%get the best number of colors for the color palette
%Input:
%I: input image double (0-1)
%visualize: flag for visualization (1=yes "default", 0=no)
%Output:
%K: number of best colors per palette 
%C: best color palette
%Labels: labeled pixels to know the pixels associated with each color in C

%Version 2: Here, we use superpixels for the first stage of clustering instead of the color palette extraction followed by DBSCAN. 



%Please cite:
%Afifi, M. “Dynamic Length Colour Palettes.” Electronics Letters, vol. 55, no. 9, Institution of Engineering and Technology ({IET}), May 2019, pp. 531–533, doi:10.1049/el.2019.0064.


I = imresize(I,[400,400],'nearest');
if nargin==1
    visualize=1;
end
O=I; %take a copy
sigma=40; %sigma
initial_K = 50;
[C_initial, Labels] = extract_theme(I, initial_K, sigma,1); %get color palette
weights = zeros(initial_K,1);
for i  = 1 : initial_K
    weights(i) = sum(Labels(:) == i)./length(Labels(:));
end
[IDs, ~]= DBSCAN(rgb2lab(C_initial),20,2); %change the threshold to get different results. Here, we use 17 as a threshold of deltaE76 value.
K = max(unique(IDs))+1;
sigma=40; %sigma
[C, Labels] = extract_theme(I, K, sigma,1); %get color palette

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

