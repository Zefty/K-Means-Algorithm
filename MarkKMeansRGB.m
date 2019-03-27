function [mark] = MarkKMeansRGB(specifiedFunctionName)
% marks the KMeansRGB function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% KMeansRGB takes three inputs in the following order:
% 1)	A 3D array with m rows, n columns and 3 layers, containing an RGB image.
% 2)	A 3D array containing k rows, 1 column and 3 layers,
%       containing the seed mean values which will be used to initialise the k-means algorithm.
% 3)	The maximum number of iterations to perform.
%
% It returns two outputs in the following order:
% 1)	A 2D array with m rows and n columns specifying which cluster each
%        pixel belongs to
% 2)	A 3D array containing k rows, 1 column and 3 layers, where each row
%       contains the mean colour values for the cluster corresponding to that row number.  E.g. the mean R, G and B values for cluster 1 will be stored in row 1.  The mean R, G and B values for cluster 2 will be stored in row 2 and so on.
%
% author: Peter Bier

% default the function name to KMeansRGB, if no optional arg specified
if nargin == 0
    functionName = 'KMeansRGB';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataKMeansRGB

input1 = KMeansRGBInput1;
input2 = KMeansRGBInput2;
input3 = KMeansRGBInput3;

expectedOutput1 = KMeansRGBExpectedOutput1;
expectedOutput2 = KMeansRGBExpectedOutput2;

purpose = KMeansRGBTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1{i} output2{i}] = feval(functionName,input1{i},input2{i},input3{i});
        % check if result returned closely matches the expected result
        
        % check first output matches (these will be integer values)
        if isequal( expectedOutput1{i},output1{i} )
            % check second output is within tolerance level
            if (expectedOutput2{i}-output2{i}) <1e-9
                totalPassed = totalPassed + 1;
                disp([m 'Passed test']);
            else
                disp([m 'FAILED test']);
            end
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


