clear;close all; clc;

% this code is for paper:
% Fast Fusion-based Dehazing With Histogram Modification and Improved Atmospheric Illumination Prior
% part of this code is based on this code 
%   "Exposure Fusion"
%   Tom Mertens, Jan Kautz and Frank Van Reeth In Proceedings of Pacific Graphics 2007
addpath(genpath('hazy_image'));


%  I_hazy = imread('0586.jpg');
%  I_hazy = imread('1352.jpg');
%  I_hazy = imread('tower.jpeg');
%  I_hazy = imread('MLS_Google_585.png');
%  I_hazy = imread('buildings.jpg');
%  I_hazy = imread('3146.jpg');
%  I_hazy = imread('4184.jpg');
%  I_hazy = imread('Manhattan.jpg');
%  I_hazy = imread('canyon.jpg');
%  I_hazy = imread('13_outdoor_hazy.jpg');
%  I_hazy = imread('yellow_veil.png');


%............

 
I_hazy=double(I_hazy )/255;

tic;

dehazed=Dehaze(I_hazy);

runtime=toc;

fprintf('the running time is %f\n', runtime);
figure ;
imshow(I_hazy);
figure ;
imshow(dehazed);
