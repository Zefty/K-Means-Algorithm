function [mark] = MarkUpdateMeans(specifiedFunctionName)
% marks the UpdateMeans function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% UpdateMeans takes three inputs in the following order:
% 1)	A 3D array with m row, n columns and 3 layers, containing an RGB image
% 2)	A single value, k, specifying how many clusters there are.
% 3)	A 2D array with m rows and n columns specifying which cluster each pixel belongs to.
%
% It returns A single output, a 3D array containing k rows, 1 column and 3 layers, 
% containing the mean values for each cluster.  
% E.g. the mean R, G and B values for cluster 1 will be stored in row 1.  
% The mean R, G and B values for cluster 2 will be stored in row 2 and so on.
%
% author: Peter Bier

% default the function name to UpdateMeans, if no optional arg specified
if nargin == 0
    functionName = 'UpdateMeans';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataUpdateMeans

input1 = UpdateMeansInput1;
input2 = UpdateMeansInput2;
input3 = UpdateMeansInput3;

expectedOutput1 = UpdateMeansExpectedOutput;

purpose = UpdateMeansTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1{i}] = feval(functionName,input1{i},input2{i},input3{i});
        % check if result returned closely matches the expected result
        
        if (expectedOutput1{i}-output1{i}) <1e-9            totalPassed = totalPassed + 1;
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


