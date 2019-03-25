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

% Calculates the number of k means there are 
kMeans = size(rgbOfKMeans,1);

% Creating cell arrays to calculate each of the k means simultaneously
cellsOfKMeans = num2cell(rgbOfKMeans,3);
cellsOfImageData(1:kMeans,1) = {imageData};

% Calculating the squared distance between each cell 
formula = @(image,kMean) sum((image-kMean).^2,3);
d = cellfun(formula,cellsOfImageData,cellsOfKMeans,'UniformOutput',false);

% Concatenating the 2D arrays in each cell to form a 3D array, with each
% layer representing the squared distance of a k mean
d = cat(3, d{:});

% Finding the minimum squared distance tells us which k mean (cluster) each
% pixel belongs to 
[~,clusterNum] = min(d,[],3);
return