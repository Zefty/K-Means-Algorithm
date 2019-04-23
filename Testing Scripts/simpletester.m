clear;
clc;
close all;

pic = imread('clocktower.jpg');
k = 10;
max_its = 500;
seeds = [127,270;132,449;150,484;184,491;70,347;84,344;201,35;74,115;193,433;100,400];

figure(1);
imshow(pic);

pic=double(pic);

profile on;

points = seeds(1:k, :);
% points = SelectKRandomPoints(pic, k); % uncomment for random points

clusts = GetRGBValuesForPoints(pic, points);

[assign, clusts] = KMeansRGB(pic, clusts, max_its);

k_pic = CreateKColourImage(assign, clusts);

profile off;

figure(2);
imshow(k_pic);

if k == 10 && exist('k_pic_out.mat', 'file') == 2
    load('k_pic_out.mat');
    if isequal(k_pic_out, k_pic)
        disp('Algorithm is... Correct');
    else
        disp('Algorithm is... Incorrect');
    end
end

profile viewer;