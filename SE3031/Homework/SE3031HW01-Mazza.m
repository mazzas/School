%% Homework 01 - Steve Mazza
%% Problem 1
% Calculate the day of week given an arbitrary date.
clc
clear all
	% Get user input.
	Year = input('\nEnter the year (YYYY): ');
	Month = input('Enter the month: ');
	Day = input('Enter the day: ');
	fprintf('\nYou entered %3.0f/%2.0f/%4.0f', Month, Day, Year)

% Parse user input for variable assignment.
D = Day;
	m = Month - 2;
	if m <= 0
		m = m + 12;
		Year = Year - 1;
	end
Y = mod(Year, 100);
c = (Year - Y) / 100;

% Now perform the calculation.
% NOTE: I think that within the constraint of valid input, floor() and trunc()
%	behave the same.
WeekDay = mod(D + floor(0.2*(13*m-1)) + Y + floor(Y/4) + floor(c/4) - 2*c+777,7);

% Output result to the user.
DOW = {'Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday'};
fprintf('\n\nYour weekday is: %s\n', DOW{WeekDay + 1});
