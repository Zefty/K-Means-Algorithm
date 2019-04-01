function [mark] = MarkGetRGBValuesForPoints(specifiedFunctionName)
% marks the GetRGBValuesForPoints function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% GetRGBValuesForPoints takes two inputs in the following order:
% 1) a 3D array representing an image
% 2) a kx2 value array specifying the points to fetch
%
% It returns one output, a kx1x3 array representing selected points
%
% author: Peter Bier

% default the function name to GetRGBValuesForPoints, if no optional arg specified
if nargin == 0
    functionName = 'GetRGBValuesForPoints';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataGetRGBValuesForPoints

input1 = GetRGBValuesForPointsInput1;
input2 = GetRGBValuesForPointsInput2;

expectedOutput1 = GetRGBValuesForPointsExpectedOutput;

purpose = GetRGBValuesForPointsTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1{i}] = feval(functionName,input1{i},input2{i});
        % check if result returned closely matches the expected result
        
        if isequal( expectedOutput1{i},output1{i} )
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


