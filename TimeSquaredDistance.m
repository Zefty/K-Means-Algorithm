function [mark] = TimeSquaredDistance(specifiedFunctionName)
% Times the SquaredDistance function
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% Time SquaredDistance by running it 4,000,000 times
% Timing standards are based on execution time when code is run on the
% university lab machines
% Timing will be done by testing 4,000,000 calls three times and averaging the
% result
% Note you can only earn timing marks if your SquaredDistance function
% earned full functionality marks, i.e. you need a working SquaredDistance
% function to be eligible for the timing marks.
% If the average time is less than 5 seconds you get 1 mark
% if the average time is more than 5 seconds you do not earn a timing mark
% author: Peter Bier

% default the function name to SquaredDistance, if no optional arg specified
if nargin == 0
    functionName = 'SquaredDistance';
else
    functionName = specifiedFunctionName;
end

% set up 1000 input arrays
for i=1:300
    input1{i}=randi(255,3,1);
    input2{i}=randi(255,3,1);
end
for i=301:700
    input1{i}=randi(255,1,3);
    input2{i}=randi(255,1,3);
end
for i=701:1000
    input1{i}=randi(255,1,1,3);
    input2{i}=randi(255,1,1,3);
end


try
    fprintf('Begininning timing of three iterations for %s ...\n', functionName)
    for i=1:3
        tic % start the clock
        for k =1:4000
            for j=1:1000
            d = SquaredDistance(input1{i},input2{i});
            
            end
        end
        time(i) = toc; % stop the clock
        fprintf('Time for iteration %i was %.4f\n',i,time(i));
    end
    
    averageTime = mean(time);
    fprintf('Summary for %s: ',functionName);
    if averageTime <5
        fprintf('Average time below 5 seconds\n Award 1 marks\n');
        mark = 1;
        
    else
        fprintf('Average time above 5 seconds\n  Award 0 marks\n');
        mark = 0;
    end
    
catch ex
    disp([functionName 'FAILED test']);
    ProcessMarkingException(ex, functionName)
    mark = 0;
end
