function [mark] = MarkCreateKColourImage(specifiedFunctionName)
% marks the CreateKColourImage function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% CreateKColourImage takes two inputs in the following order:
% 1)	A 2D array with m rows and n columns, specifying which cluster 
%       each pixel belongs to
% 2)	A 3D array containing k rows, 1 column and 3 layers, where each 
%       row contains the mean colour values for the cluster corresponding 
%       to that row number.  E.g. the mean R, G and B values for cluster 1 
%       will be stored in row 1.  The mean R, G and B values for cluster 2 
%       will be stored in row 2 and so on.
%
%
% It returns one output,  A 3D array of unsigned 8 bit integers with m rows, 
% n columns and 3 layers, representing an RGB image.
% author: Peter Bier

% default the function name to CreateKColourImage, if no optional arg specified
if nargin == 0
    functionName = 'CreateKColourImage';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataCreateKColourImage

input1 = CreateKColourImageInput1;
input2 = CreateKColourImageInput2;

expectedOutput1 = CreateKColourImageExpectedOutput1;

purpose = CreateKColourImageTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1{i}] = feval(functionName,input1{i},input2{i});
        % check if result returned closely matches the expected result
        
        if isa(output1{i},'uint8')
            disp('Is correct type (uint8 array)')
            isuint8 = true;
        else
            disp('You are not returning an array of uint8 values')
            isuint8 = false;
        end
        
        
        if isuint8 && isequal( expectedOutput1{i},output1{i} )
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


