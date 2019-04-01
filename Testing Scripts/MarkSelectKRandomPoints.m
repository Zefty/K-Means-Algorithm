function [mark] = MarkSelectKRandomPoints(specifiedFunctionName)
% marks the SelectKRandomPoints function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% SelectKRandomPoints takes two inputs in the following order:
% 1) a 3D array representing an image
% 2) a k value specifying how many points to generate
%
% It returns one output, a kx2 array representing randomly selected points
%
% author: Peter Bier

% default the function name to SelectKRandomPoints, if no optional arg specified
if nargin == 0
    functionName = 'SelectKRandomPoints';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataSelectKRandomPoints

input1 = SelectKRandomPointsInput1;
input2 = SelectKRandomPointsInput2;

%expectedOutput1 = SelectKRandomPointsExpectedOutput;

purpose = SelectKRandomPointsTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('Summary for %s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    t = sprintf('%s Test %i\n\tPurpose:\t%s \n', functionName, i, purpose{i});
    
    try
        
        [output1{i}] = feval(functionName,input1{i},input2{i});
        % check if values are within valid range and there are no repeats
        
        maxrow = size(input1{i},1);
        maxcol = size(input1{i},2);
        rowIndicesForPoints = output1{i}(:,1);
        colIndicesForPoints = output1{i}(:,2);
        
        
        
        disp('-------------------------------------------')
        disp(t);
        
        fprintf(1,'Checking output is a %d x 2 array\n',input2{i} )
        fprintf(1,'Size is %d x %d\n',size(output1{i},1),size(output1{i},2)); 
        if size(output1{i},1) == input2{i} && size(output1{i},2)== 2
            disp('  Correct size.')
            correctSize = true;
        else
            disp('  Incorrect size.')
            correctSize = false;
        end
        
        
        disp('Checking row indices:')
        disp(rowIndicesForPoints')
        if rowIndicesForPoints > 0 & rowIndicesForPoints <= maxrow & mod(rowIndicesForPoints,1)==0
            disp('  Rows within valid range.')
            rowsValid = true;
        else
            disp('  Some row values invalid.')
            rowsValid = false;
            
            
        end
        
        disp('Checking col indices:')
        disp(colIndicesForPoints')
        if colIndicesForPoints > 0 & colIndicesForPoints <= maxcol & mod(colIndicesForPoints,1)==0
            disp('  Cols within valid range.')
            colsValid = true;
        else
            disp('  Some col values invalid.')
            colsValid = false;
            
        end
        
        disp('Checking for duplicate values')
        disp(output1{i})
        if size(output1{i}) == size(unique(output1{i},'rows'))
            disp('  All points are unique.')
            uniquePoints = true;
        else
            disp('  Some duplicate points present in array.')
            uniquePoints = false;
        end
        
        if correctSize && rowsValid && colsValid && uniquePoints
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


