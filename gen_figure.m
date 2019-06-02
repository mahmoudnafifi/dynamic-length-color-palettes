function O = gen_figure(I, P)

P = imresize( P , [round(size(I,1)/4), size(I,2)]);
O = ones(size(I,1) + size(P,1) ,size(I,2),3);
O(1:size(P,1) - 50 ,:,:) = P(1:end-50,:,:);
O (end -size(I,1)+1:end , : , : ) = im2double(I);

end

