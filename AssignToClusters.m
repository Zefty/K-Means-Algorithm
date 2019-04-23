function [clusterNum] = AssignToClusters(imageData,rgbOfKMeans)
% Assigns each point (pixel) of an image to a cluster based on the k mean
% it is closest to (e.g. if the pixel at row 1 col 1 is closest to the 3rd
% mean then it will be assigned to the 3rd cluster). The minimum squared
% distance is found between each point (pixel) and each of the k means to
% determine which k mean each pixel is closest to. 
% Note: The number of clusters avaiable for assignment is equivalent to the
% number of k means there are. 
%
% Inputs:  imageData = The image with its data represented in a 3D array,
%          with m rows, n columns, and 3 layers describing each pixel in
%          terms of its RGB value.
%
%          rgbOfKMeans = A k row, 1 column, 3 layer, 3D array describing
%          the RGB values of the k means used for assigning each point
%          (pixel) to a cluster. 
%          Note: The k rows represents the k number of means.  
%
% Outputs: clusterNum = A 2D array with the same numer of rows and columns
%          as the image, showing the corresponding cluster that each pixel
%          belongs to (based on the k means it was closest to). 
%
% Author: Jaime Wu

% % Calculates the number of k means there are 
% kMeans = size(rgbOfKMeans,1);
% d = zeros(size(imageData,1),size(imageData,2),kMeans(1));
% 
% for k = 1:kMeans(1)
%     d(:,:,k) = sum((imageData(:,:,:) - rgbOfKMeans(k,1,:)).^2,3);
% end
% 
% % Finding the minimum squared distance tells us which k mean (cluster) each
% % pixel belongs to 
% [~,clusterNum] = min(d,[],3);
k = size(rgbOfKMeans,1);
rowsOfImage = size(imageData,1);
distanceSquared = zeros(size(imageData,1)*size(imageData,2),k);

rgbOfKMeans = reshape(rgbOfKMeans,[],3);
imageData = reshape(imageData,[],3);
for kMean = 1:k
    distanceSquared(:,kMean) = (imageData(:,1) - rgbOfKMeans(kMean,1)).^2 + (imageData(:,2) - rgbOfKMeans(kMean,2)).^2 + (imageData(:,3) - rgbOfKMeans(kMean,3)).^2;
end
[~,clusterNum] = min(distanceSquared,[],2);
clusterNum = reshape(clusterNum,rowsOfImage,[]);
return

