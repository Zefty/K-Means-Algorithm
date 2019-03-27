function [mark] = MarkAssignToClusters(specifiedFunctionName)
% marks the AssignToClusters function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% AssignToClusters takes two inputs in the following order:
% 1)	A 3D array with m rows, n columns and 3 layers, containing an RGB image
% 2)	A 3D array containing k rows, 1 column and 3 layers containing the colour information for each of k means.
%
% It returns a single output being a 2D array with m rows and n columns, 
% that contains the corresponding cluster number for each pixel in the 
% image.  
%
% author: Peter Bier

% default the function name to AssignToClusters, if no optional arg specified
if nargin == 0
    functionName = 'AssignToClusters';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataAssignToClusters

input1 = AssignToClustersInput1;
input2 = AssignToClustersInput2;

expectedOutput1 = AssignToClustersExpectedOutput;

purpose = AssignToClustersTestPurpose;

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
allocatedMarks = 4;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


