%Demo
close all
clc
clear;
imgname = fullfile('imgs','image_01.jpg');
I=imread(imgname);


I=im2double(I);
[K, C, Labels] = getBestCP(I, 0);


palette1=zeros(50,300,3); % for visualization
for c=1:K
    palette1(1:50,1+((c-1)*300/K):(c*300/K)+1,1)=C(c,1);
    palette1(1:50,1+((c-1)*300/K):(c*300/K)+1,2)=C(c,2);
    palette1(1:50,1+((c-1)*300/K):(c*300/K)+1,3)=C(c,3);
end
I = gen_figure(I,palette1); imshow(I);
imwrite(I,strcat(imgname(1:end-4), 'out.png'));
