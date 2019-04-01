function [mark] = TimeKMeansRGB(specifiedFunctionName)
% Times the KMeansRGB function
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% Time KMeansRGB by running it 10,000 times
% Timing standards are based on execution time when code is run on the
% university lab machines
% Timing will be done by testing 10,000 calls three times and averaging the
% result
% Note you can only earn timing marks if your KMeansRGB function
% earned full functionality marks, i.e. you need a working KMeansRGB
% function to be eligible for the timing marks.
% If the average time is less than 5 seconds you get 1 mark
% if the average time is more than 5 seconds you do not earn a timing mark
% author: Peter Bier

% default the function name to KMeansRGB, if no optional arg specified
if nargin == 0
    functionName = 'KMeansRGB';
else
    functionName = specifiedFunctionName;
end

% set up input arrays

A = double(imread('clocktower.jpg'));

% get the number of colours and maximum number of iterations from the user
k = 8;

% convert image data to double format so we can do calculations with it
A=double(A);

points =[    57   203;
    153   381;
    125   455;
    169   177;
    22   338;
    282   120;
    77   132;
    27   217];

% use selected points to get the colour values for our seed means
seedMeans = GetRGBValuesForPoints(A,points);




try
    fprintf('Begininning timing of three iterations for %s ...\n', functionName)
    for i=1:3
        tic % start the clock
        
        % use the k means algorithm to segment all pixels in the image
        % into one of k clusters and calculate the corresponding means
        [clusters, means] = KMeansRGB(A,seedMeans,56);
        
        time(i) = toc; % stop the clock
        fprintf('Time for iteration %i was %.4f\n',i,time(i));
    end
    
    averageTime = mean(time);
    fprintf('Summary for %s: ',functionName);
    if averageTime <5
        fprintf('Average time below 5 seconds\n Award 2 marks\n');
        mark = 2;
        
    elseif averageTime <30
        fprintf('Average time above 5 seconds buy below 30\n  Award 1 marks\n');
        mark = 1;
    else
        fprintf('Average time above 30 seconds\n  Award 0 marks\n');
        mark = 0;
    end
    
catch ex
    disp([m 'FAILED test']);
    ProcessMarkingException(ex, functionName)
    mark = 0;
end
