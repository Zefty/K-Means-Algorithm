function [kPoints] = SelectKRandomPoints(imageData,k)
% SelectKRandomPoints randomly generates a list of k pixels from an image,
% represented in a 2D array. Every row in the 2D array corresponds to the
% location of a randomly selected point (pixel), and each point(pixel)
% should be unique. 
%
% Inputs:  imageData = The image with its data represented in a 3D array,
%          with m rows, n columns, and 3 layers for selecting points.  
%
%          k = the number of points to be randomly selected from the image.
%
% Outputs: kPoints = A 2D array containing the subscript indices of the
%          randomly selected points. The 2D array is k rows and 2 columns
%          in size, with each row containing the subscript indices of each
%          point. The first column represents row indices and the second
%          column represents column indices of each selected point. 
%
% Author: Jaime Wu

% Determine the dimensions of the image
imageSize = size(imageData);

% Randomly generate k number of pixels based on the number of elements of
% the image (considering only 1 layer of a 3D array)
index = randperm(imageSize(1)*imageSize(2), k);

% Determine the rows and columns of the k number of randomly selected
% points
columns = ceil(index./imageSize(1));
rows = index-((columns-1).*imageSize(1));

% Storing the subscript indices in a 2D array
kPoints(:,:) = [rows',columns'];
return

