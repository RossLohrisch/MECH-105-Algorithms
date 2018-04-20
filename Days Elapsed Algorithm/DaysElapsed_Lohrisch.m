%% Homework 4 Question 1
% by: Ross Lohrisch

function nd = DaysElapsed( mo,da,leap )
% This function determines the number of elapsed days since the beginning of a given year, given a date during the year, where:
%   mo = the month (1-12)
%   da = the day(1-31)
%   leap = (0 for non-leap year and 1 for leap year)

DaysPerMonth = [31 28 31 30 31 30 31 31 30 31 30 31]; %Create a 1x12 array with the number of days in each month (if leap year, extra day is added later to sum)

nd = sum(DaysPerMonth(1:(mo-1))) + da; %Define equation which calculates the number of elapsed days in a non-leap year. (sum of days in previous months plus elapsed days in current month)

if leap == 1 && mo > 2; %Create conditional statements which must be satisfied in order to use the equation for calculating elapsed days in a leap year
    nd = nd + 1; %Define equation which calculates the number of elapsed days in a leap year
end
end





