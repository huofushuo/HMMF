clear;close all; clc;

% this code is for paper:
% Fast Fusion-based Dehazing With Histogram Modification and Improved Atmospheric Illumination Prior
% part of this code is based on this code 
%   "Exposure Fusion"
%   Tom Mertens, Jan Kautz and Frank Van Reeth In Proceedings of Pacific Graphics 2007


 I_hazy = imread('tower.jpeg');

%I_hazy = imread('Manhattan.jpg');
%I_hazy = imread('swan.png');
%I_hazy = imread('y16_input.png');
%I_hazy = imread('Manhattan.jpg');
%I_hazy = imread('yellow_veil.png');
%............

I_hazy=double(I_hazy )/255;

tic;

dehazed=Dehaze(I_hazy);


imshow(dehazed);



 runtime=toc;
 fprintf('the running time is %f\n', runtime);

