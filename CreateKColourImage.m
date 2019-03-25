function [kColourImage] = CreateKColourImage(clusterNum,rgbOfKMeans)
% CreateKColourImage creates an image with k colours. The image has its
% pixels assigned into k clusters, and all pixels assigned to a given
% cluster will be coloured using the mean RGB values associated with
% that cluster (e.g. all pixels in cluster 1 will be coloured using the
% mean RGB values associated with cluster 1). 
%
% Input:  clusterNum = A 2D array with the same numer of rows and columns
%         as the image, showing the converged cluster that each pixel 
%         belongs to (based on the k means it was closest to) (e.g. if the
%         pixel, row 1, col 1, is closest to the 3rd mean after convergence
%         then it will be assigned as a 3 in the 2D array).
% 
%         rgbOfKMeans = a 3D array of the converged RGB values of k
%         means. The 3D array is k by 1 by 3 in size, with each row
%         containing the mean colour values for the cluster corresponding
%         to that row number (e.g. E.g. the mean RGB values for cluster 1
%         will be stored in row 1. The mean RGB values for cluster 2 will
%         be stored in row 2 and so on).
%
% Output: kColourImage = A 3D array of unsigned 8 bit integers with m rows,
%         n columns and 3 layers, representing an RGB image. The colour of
%         each pixel in the image is determined by the colour associated
%         with the cluster of which the pixel has been assigned to. 
%
% Author: Jaime Wu

% Cluster number for each pixel is the same across all 3 layers (RGB)
clusterNum = repmat(clusterNum,[1,1,3]);

% Preallocating an unsigned 8bit integer array for image 
kColourImage = zeros(size(clusterNum),'uint8');

% Looping through each cluster
for k = 1:size(rgbOfKMeans,1)
    % Finding linear index of position of each pixel in each cluster
    index = find(clusterNum == k);
    
    % Separating index into RGB index by reshaping into 3D array
    index = reshape(index,size(index,1)/3,1,3);
    
    % Creating the coloured imaged based on the k means and clusters that
    % each pixel belongs to 
    kColourImage(index(:,1,1)) = rgbOfKMeans(k,1,1);
    kColourImage(index(:,1,2)) = rgbOfKMeans(k,1,2);
    kColourImage(index(:,1,3)) = rgbOfKMeans(k,1,3);
end
return