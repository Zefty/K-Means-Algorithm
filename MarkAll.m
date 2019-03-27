% Mark all the seven specified functions for the 2018 matlab project
% To use this script requires a small amount of setup (see below).
%
% T
% Author: Peter Bier
%
% Setup:
% You will need to add the MarkingScripts directory to the
% matlab path so that Matlab can find the test scripts and test data files
% To do this from within Matlab right click on the directory
% called MarkingScripts and choose add to path, "Selected folders and subfolders").
% Adding a directory to the Matlab path allows Matlab to locate anything
% in that directory.  This allows you to keep your test scripts separate
% from the directory your code is stored in.
% This script assumes that you will change into a working directory
% that contains the code you want to test.
% Once setup is complete you can mark code by typing MarkAll from
% within your working directory.  You can also mark individual functions
% using the appropriate marking script, e.g. calling MarkSquaredDistance will
% test the SquaredDistance function.
%
% Note that if a function name is mispelled you can still use
% scripts to mark them, just specify the function name 
% used as an optional argument (e.g. if the SquaredDistance function is 
% named incorrectly with a lower case "s", you could mark it by typing:
% MarkSquaredDistance('squaredDistance')

clear
clc
% set up list of functions to mark
functionsList = {'SelectKRandomPoints', 'GetRGBValuesForPoints', ... 
    'SquaredDistance','AssignToClusters', 'UpdateMeans', 'KMeansRGB', ...
    'CreateKColourImage'};


divider='=======================================================';
totalMark = 0;
% Call the test function for each listed function, e.g. TestSquaredDistance
for i=1:length(functionsList)
    mark(i) = feval(['Mark' functionsList{i}],functionsList{i});
    totalMark = totalMark + mark(i);
    input('Hit enter to continue');
    disp(divider);
end

disp(['Your total functionality mark for the 7 functions is ' num2str(totalMark) '/24'])

% Next call the timing scripts if all relevent tests passed.
timingMark = 0;


% Time SquaredDistance if it passed all tests
if mark(3) == 3
    timingMark = timingMark + TimeSquaredDistance();
end
input('Hit enter to continue');

% Time KMeansRGB if it passed all tests
if mark(6) == 4
    timingMark = timingMark + TimeKMeansRGB();
end
input('Hit enter to continue');

% Time SelectKRandomPoints if it passed all tests
if mark(1) == 3
    timingMark = timingMark + TimeSelectKRandomPoints();
end


disp(['Your total timing mark is ' num2str(timingMark) '/4'])


