function [C,labels] = extract_theme(I, k, sigma, discard_black)
%I: Image
%K: number of palettes
%Sigma: is sigma
%discard_black: 1 to discard the darkest color (default), 0 otherwise
% increase one more to remove dark palette color
%This code is written by NGUYEN Ho Man Rang ~ http://www.comp.nus.edu.sg/~nguyenho/
if nargin == 3
    discard_black = 1;
end
if discard_black ==1
    k = k + 1;
end
bin = 64;
Ibin = floor(255*I/bin);

[weights, X,labels] = im3Dhist(I,Ibin, bin);
% Initialize the cluster centers
cinits = zeros(k, 3);
cw = weights;
N = size(X, 1);
sigma2 = sigma^2;
for i = 1:k
    [~,id] = max(cw);
    cinits(i,:) = X(id,:);
    d2 = repmat(cinits(i,:), N, 1) - X; 
    d2 = sum(d2 .* d2,2);
    cw = cw .* (1 - exp(-d2/sigma2));
end


opt.weight = weights;
[~, C, ~] = fkmeans(X, cinits, opt);

% C = cinits;
% sort by brightness
[~,id] = sort(C(:,1), 'descend');
C = C(id,:);
if discard_black ==1 
    C = C(1:k-1,:); %ignore black or darkest color
end
    

% covert to rgb
colorTransform = makecform('lab2srgb');
C = applycform(C, colorTransform);

function [W, C,labels] = im3Dhist(I,Ibin, bin)
[h, w, ~] = size(I);

% Compute 3D histogram 
Ibin = reshape(Ibin, [], 3);
n = bin;
J = Ibin(:,1)*n*n + Ibin(:,2)*n + Ibin(:,3) + 1;
N = h*w;
M = n * n * n;


% Compute the mean of each bin in Lab
colorTransform = makecform('srgb2lab');
lab = applycform(I, colorTransform);
lab = reshape(lab, [], 3);
weights = zeros(M, 2);
csums = zeros(M, 3);
for i = 1:N
    if J(i) < 1 || J(i)>M
        continue;
    end
    weights(J(i),1) = weights(J(i),1) + 1;
    weights(J(i),2)=J(i); %index of J
    csums(J(i),:) = csums(J(i),:) + lab(i,:);
end

% Remove all empty bins
ids = find(weights(:,1) ~= 0);
W = weights(ids,:);
C = csums(ids,:);
C = C ./ repmat(W(:,1),1,3);

labels=zeros(size(Ibin));
for i=1:size(W,1)
    labels(J==W(i,2))=i;
end
labels=reshape(labels,[h, w,3]);
W=W(:,1);