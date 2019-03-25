function [rgbOfKMeans] = UpdateMeans(imageData,kClusters,clusterNum)
% UpdateMeans calculate new means for each cluster. The new mean is 
% calculated using the RGB values of all the points (pixels) in that
% cluster. 
%
% Inputs: imageData = The image with its data represented in a 3D array,
%         with m rows, n columns, and 3 layers describing each pixel in
%         terms of its RGB value.
%
%         kClusters = refers to the number of clusters. 
%         Note: the number of clusters is the same as the number of k means
%         (i.e. the number of k means leads to the formation of k
%         clusters).
%
%         clusterNum = A 2D array with the same numer of rows and columns
%         as the image, showing the corresponding cluster that each pixel
%         belongs to (based on the k means it was closest to).  
%
% Output: rgbOfKMeans = A k row, 1 column, 3 layer, 3D array describing the
%         RGB values of the k means. Each row contains the mean RGB values
%         for the corresponding k cluster (e.g. the mean RGB values for
%         cluster 3 will be stored in row 3). 
%
% Author: Jaime Wu 

% Preallocating array
rgbOfKMeans = zeros(kClusters,1,3);

% Looping through the clusters
for k = 1:kClusters
    % Logically indexing each cluster and creating layers for RGB
    index = clusterNum == k;
    index = repmat(index,[1,1,3]);
    
    % Finding the rgb values for each cluster and putting it in the right
    % layer
    rgbOfCluster = imageData(index);
    rgbOfCluster = reshape(rgbOfCluster,size(rgbOfCluster,1)/3,1,3);
    
    % Updating means by calculating the average RGB colour for each cluster
    rgbOfKMeans(k,1,:) = mean(rgbOfCluster,1);
end
return