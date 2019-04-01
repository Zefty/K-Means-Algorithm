function [mark] = MarkSquaredDistance(specifiedFunctionName)
% Marks the SquaredDistance function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% SquaredDistance takes two inputs in the following order:
% 1)	An array containing three elements representing a point in 3D space
% 2)	An array containing three elements representing a second point in 3D space 
%
% It returns a single output, the square of the distance between the two points in 3D space.
%
% author: Peter Bier

% default the function name to SquaredDistance, if no optional arg specified
if nargin == 0
    functionName = 'SquaredDistance';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataSquaredDistance

input1 = SquaredDistanceInput1;
input2 = SquaredDistanceInput2;

expectedOutput1 = SquaredDistanceExpectedOutput;

purpose = SquaredDistanceTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output1{i} = feval(functionName,input1{i},input2{i});
        % check if result returned closely matches the expected result
        
        if isequal(expectedOutput1{i},output1{i})
            totalPassed = totalPassed + 1;
            disp([m 'Passed test']);
        else
            disp([m 'FAILED test']);
        end
        
    catch ex
        disp([m 'FAILED test']);
        ProcessMarkingException(ex, functionName)
    end
    
end

% display marks summary
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


