clear all
% Store data as Cells
table_cells = readcell('hw4_data.txt');
% Pull units out of table
table_units = table_cells(1:2,:);
% Create Table out of file
opts = detectImportOptions('hw4_data.txt');
opts = setvartype(opts,{'YY','MM','DD','hh','mm','WDIR','MWD'},'int32')
table_data = readtable('hw4_data.txt',opts);

% Extract date data from table
year = table2array(table_data(:,1));
month = table2array(table_data(:,2));
day = table2array(table_data(:,3));
hour = table2array(table_data(:,4));
min = table2array(table_data(:,5));
sec = zeros(size(year));
% Create datetime style date format
datevar = datetime(year,month,day, hour,min,sec);
% Assign first Row as datetime format date
table_data.YY = datevar;

% Create a figure that line plots Air by Time
figure_1 = figure('Name', 'Air Temperature by Time');
plot_airtemp_time = plot(table_data.YY,table_data.ATMP);
title('Air Temperature by Time');
xlabel('Date');
ylabel('Air Temperature (C)');

% Create a figure that scatter plots Waveheight by Wind speed
figure_2 = figure('Name', 'Wave Height by Wind Speed');
plot_waveheight_windspeed = scatter(table_data.WSPD,table_data.WVHT);
title('Wave Height by Wind Speed');
xlabel('Wind Speed (m/s)');
ylabel('Wave Height (m)');

% Using TimeTable and Table to Modify Data
% Convert Table into TimeTable to apply time edits
time_table = table2timetable(table_data);
% Edit TimeTable to average daily values
daily_average = retime(time_table, 'daily','mean');
% Reduce Year column down to year data
year_average = string(datetime(daily_average.YY,"Format","yyyy"));
% Convert Timetable back to table
daily_average = timetable2table(daily_average);
% Reduce datetime in year column to just year
daily_average.YY = year_average;
% Formattting Table with sensible decimal places
daily_average{:,{'WDIR','MWD'}} = round(daily_average{:,{'WDIR','MWD'}});
daily_average{:,{'WSPD','GST','PRES','ATMP','WTMP'}} = round(daily_average{:,{'WSPD','GST','PRES','ATMP','WTMP'}},1);
daily_average{:,{'WVHT','DPD','APD','TIDE'}}= round(daily_average{:,{'WVHT','DPD','APD','TIDE'}},2);

% Packageing Data to be output to File
% Convert Table to Cell Array
daily_average_cells = table2cell(daily_average);
% Append Header rows from original file onto averaged data
daily_average_output = [table_units;daily_average_cells];
% Delete uncecessary hour and minute columns
daily_average_output(:,4:5) = [];
% Ouput File
writecell(daily_average_output,'hw4_daily_data.txt','Delimiter','tab');





