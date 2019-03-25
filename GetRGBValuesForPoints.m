function [rgbOfKPoints] = GetRGBValuesForPoints(imageData,kPoints)
% GetRGBValuesForPoints returns the RGB colour values for a list of
% specified points (pixels) from an image in a 3D array. Every row in the
% 3D array corresponds to the colour of a point (pixel).
%
% Inputs:  imageData = The image with its data represented in a 3D array,
%          with m rows, n columns, and 3 layers describing each pixel in
%          terms of its RGB value.
%
%          kPoints = A 2D array containing the subscript indices of the
%          randomly selected points. The 2D array is k rows and 2 columns
%          in size, with each row containing the subscript indices of each
%          point. The first column represents row indices and the second
%          column represents column indices of each selected point. 
%
% Outputs: colourOfPixels = A 3D array of the colour of the k points 
%          (pixels). The 3D has k rows, 1 column, and 3 layers, with each
%          row corresponding to the RGB value of each point (point). 
%    
% Author: Jaime Wu

% Preallocating array 
rgbOfKPoints = zeros(size(kPoints,1),1,3);

% Looping through the k number of points to get their RGB values
for k = 1:size(kPoints,1)
    % Extracting the RGB value of the kth point and storing it in
    % rgbOfKPoints in the same order
    rgbOfKPoints(k,1,:) = imageData(kPoints(k,1),kPoints(k,2),:);
end
return