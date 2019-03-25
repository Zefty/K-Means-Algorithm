function  [distanceSquared] = SquaredDistance(pointOne,pointTwo)
% Calculates the square of the distance between two points (two pixels in
% terms of their RGB value) in 3D space.
%
% Inputs:  pointOne = First point in 3D space
%
%          pointTwo = Second point in 3D space
%
% Outputs: distanceSquared = The squared distance between the two points in
%          3d space  
%
% Author: Jaime Wu 

% Formula for calculating squared distance between two 3d points in space 
distanceSquared = sum((pointOne - pointTwo).^2);
return