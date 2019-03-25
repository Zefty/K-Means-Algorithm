function [clusterNum,rgbOfKMeans] = KMeansRGB(imageData,rgbOfKMeans, ...
    maxIterations)
% Given an initial set of k means, KMeansRGB proceeds by alternating
% between AssignToClusters and UpdateMeans (AssignToClusters' and 
% UpdateMeans' functionality and purpose is explained via its own
% function). The two functions are repeated until the values of k means
% converge. Convergence is achieved when k means is unchanged from its
% previous update, and points (pixels) no longer move between clusters (i.e
% stays in the same cluster as the previous iteration of AssignToClusters).
% Once convergence has been reached, KMeansRGB returns the converged
% cluster number of each point (pixel), and the convered RGB value of the k
% means.
% Note: that convergence is NOT guaranteed, and there is a max number of
% iterations of the two functions to prevent an infinite loop from
% occuring. 
%
% Input:  imageData = The image with its data represented in a 3D array,
%         with m rows, n columns, and 3 layers describing each pixel in
%         terms of its RGB value.
%
%         rgbOfKMeans = A k row, 1 column, 3 layer, 3D array describing
%         the RGB values of the k means used for assigning each point
%         pixel) to a cluster. 
%         Note: The k rows represents the k number of means. 
%
%         maxIterations = Maximum number of times to loop between 
%         AssignToClusters and UpdateMeans unless convergence has been
%         reached.    
%
% Output: clusterNum = A 2D array with the same numer of rows and columns
%         as the image, showing the converged cluster that each pixel 
%         belongs to (based on the k means it was closest to) (e.g. if the
%         pixel, row 1, col 1, is closest to the 3rd mean after convergence
%         then it will be assigned as a 3 in the 2D array). 
%
%         rgbOfKMeans = A k row, 1 column, 3 layer, 3D array describing the
%         converged RGB values of the k means. Each row contains the mean
%         RGB values for the corresponding k cluster (e.g. the mean RGB 
%         values for cluster 3 will be stored in row 3).    
%
% Author: Jaime Wu

% Calculates the number of k means there are
kClusters = size(rgbOfKMeans,1);

% Alternating between AssignToClusters and UpdateMeans
for i = 1:maxIterations
    % Determining the cluster each pixel belongs to intially, and after
    % each time k mean updates
    [clusterNum] = AssignToClusters(imageData,rgbOfKMeans);
    
    % Saves the old k mean RGB values before new k mean RGB values are
    % calculated
    rgbOfKMeansOld = rgbOfKMeans;
    [rgbOfKMeans] = UpdateMeans(imageData,kClusters,clusterNum);
    
    % If the new k mean values calculated are equal to the old k mean
    % values then convergence has been reached
    if (rgbOfKMeans == rgbOfKMeansOld)
        % Returns the converged cluster numbers and returns the converged k
        % mean RGB values
        return
    end
end

% When max interations is reached and there is no convergence, this message
% will be displayed, and returns the non-converged cluster numbers and k
% mean RGB values.
disp('Maximum number of iterations reached before convergence was achieved')
return