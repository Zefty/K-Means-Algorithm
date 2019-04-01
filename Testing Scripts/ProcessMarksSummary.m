function [mark] = ProcessMarksSummary( functionName, totalPassed, numTests,numMarks )
% displays the appropriate mark given what fraction of tests were passed
% (totalPassed/numTests) and how many marks the function is worth
% (numMarks)
% author: Peter Bier

disp(sprintf('\n'));
disp(['Summary for ' functionName ': Passed ' num2str(totalPassed) ' tests out of ' num2str(numTests)]);
mark = floor(numMarks * totalPassed/numTests);
disp(sprintf('  Award %i marks',mark));

end

