%% Homework 03 - Steve Mazza
%% Problem 1
%
close all
clc
clear all

% Define and populate the structure array, Family.
Family(1) = struct('relation','Father','name','Paul','state','FL','age',73);
Family(2) = struct('relation','Mother','name','Ellie','state','MD','age',72);
Family(3) = struct('relation','Spouse','name','Sherri','state','MD','age',45);
Family(4) = struct('relation','Son','name','Jake','state','MD','age',11);
Family(5) = struct('relation','Son','name','Sam','state','MD','age',9);

% Find the minimun age from the structure array and output the result.
fprintf('\n\nThe minimum age in my family is %d.\n', min([Family.age]));

%% Problem 2
%
close all
clc
clear all

% Define and populate the 3D cell array, Family.
Family(1,1,1:5) = {'Father' 'Mother' 'Spouse' 'Son' 'Son'};
Family(1,2,1:5) = {'Paul' 'Ellie' 'Sherri' 'Jake' 'Sam'};
Family(2,1,1:5) = {'FL' 'MD' 'MD' 'MD' 'MD'};
Family(2,2,1:5) = {73 72 45 11 9};

% Find the minimun age from the structure array and output the result.
fprintf('\n\nThe minimum age in my family is %d.\n', min([Family{2,2,:}]));

%% Problem 3
%
close all
clc
clear all

% Read data in from an external file.
[Speed, Altitude] = textread('DropSondeData.txt',...
    '%*f %*f %*f %*f %*f %f %*f %*f %*f %f %*d','headerlines',15);

% Sort the data in ascending order by Altitude.
% Defult sorting is on 1st column, ascending.
DSData = sortrows([Altitude,Speed]);

% Display formatted output of first 10 lines.
fprintf('\n\n\t|\tAltitude, m\t|\tSpeed, m/s\t|\n');
for i=1:10
    fprintf('\t|\t\t%.1f\t|\t\t%.2f\t|\n',DSData(i,1),DSData(i,2));
end

%% Problem 4
%
close all
clc
clear all

% Declare and initialize data arrays (given).
WSFO = [6.7 7.5 8.5 9.5 10.4 10.9 11.2 10.5 9.1 7.6 6.3 6.5];
WOrl = [9.0 9.6 9.9 9.4  8.8  8.0  7.3  7.2 7.7 8.6 8.6 8.5];

% Declare and initialize auxiliary array.
Month = {'January' 'February' 'March' 'April' 'May' 'June' ...
    'July' 'August' 'September' 'October' 'November' 'December'};

% Calculate average wind speed for each city.
fprintf('\n\nThe average wind speed for San Francisco was %.1f mph.\n', ...
    mean(WSFO));
fprintf('The average wind speed for Orlando was %.1f mph.\n', ...
    mean(WOrl));

% Determine how many months the wind speed is below the annual average.
fprintf('\nThe wind speed was below average in San Francisco %d times.\n', ...
    numel(find(WSFO < mean(WSFO))));
fprintf('The wind speed was below average in Orlando %d times.\n', ...
    numel(find(WOrl < mean(WOrl))));

% Determine how many times and in which months the wind speed in San
%   Francisco was higher than in Orlando.
% NOTE: I would like to think that MATLAB has a more elegant way to do this
%   but the following brute force method is guaranteed to work.
x = [];
for i=1:numel(WSFO)
    if WSFO(i) > WOrl(i)
        x(end+1) = i;
    end
end
fprintf(strcat('\nThe wind speed in San Francisco Exceeded that', ...
    ' in Orlando %d time(s).\n'), numel(x));
if numel(x)>0
    fprintf('It happened in the following month(s):\n');
    for i=1:numel(x)
        fprintf('\t%s\n', Month{x(i)});
    end
end

% Determine how many times and in which months the wind spees was within
%   0.2 mph of Orlando.
x = [];
for i=1:numel(WSFO)
    if abs(WSFO(i)-WOrl(i)) <= 0.2
        x(end+1) = i;
    end
end
fprintf(strcat('\nThe wind speed in San Francisco was within 0.2 mph', ...
    ' of that in Orlando %d time(s).\n'), numel(x));
if numel(x)>0
    fprintf('It happened in the following month(s):\n');
    for i=1:numel(x)
        fprintf('\t%s\n', Month{x(i)});
    end
end
