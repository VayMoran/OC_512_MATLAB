close all
clear all
clc

% Load all states and set projection
states = shaperead('usastatehi','UseGeoCoords',true);
current_ellipsoid =referenceEllipsoid('wgs84');

% Load precipitation data
[A,R] = readgeoraster('PRISM_ppt_30yr_normal_4kmM2_annual_asc\PRISM_ppt_30yr_normal_4kmM2_annual_asc.asc');
% Replace null precipitation with 0
A(A<0)=0;
% Create Lon/Lat grid of precipitaiton data
[rain_lon,rain_lat]=meshgrid([0:1:R.RasterSize(2)-1]*R.CellExtentInLongitude+R.LongitudeLimits(1), ...
[R.RasterSize(1)-1:-1:0]*R.CellExtentInLatitude+R.LatitudeLimits(1));

% Prepare data for table
varTypes = ["string","double","double"];
varNames = ["State", "Area (km^2)", "Precipitation (m)"];
table_size = [51 3];

% Create Table for my data
my_data  = table('Size', table_size,'VariableTypes',varTypes,'VariableNames',varNames);

for i = 1:size(states)
    % Assign state and find its lat/long coordinates
    current_state = states(i).Name;
    lat=states(i).Lat;
    lon=states(i).Lon;
    
    % Find the area recorded by All States
    main_area = areaint(lat(1:end-1),lon(1:end-1),current_ellipsoid)/1000/1000;
    % Add up broken geometries
    current_area = sum(main_area);
    
    % Put State name and area into table
    my_data.State(i) = current_state;
    my_data.("Area (km^2)")(i) = round(current_area);
    
    % Find Bounding lat and lon of current state
    latlim = states(i).BoundingBox(:,2)';
    lonlim = states(i).BoundingBox(:,1)';
    
    % Find rain lat and lon data inside current state
    tf = ingeoquad(rain_lat,rain_lon,latlim,lonlim);
    precip_total = 0;
    precip_counter = 0;
    precip_mean = 0;
    
    % Iterate through Data
    for j = 1:621
        for k = 1:1405
            % If Data point is in state bounds
            if tf(j,k) == 1
                % Add precipitation and count number of data points
                precip_total = precip_total + A(j,k);
                precip_counter = precip_counter +1;
            end
        end
    end
    
    % Find current average precipitaiton
    precip_mean = precip_total/precip_counter;
    % Output precipitation
    my_data.("Precipitation (m)")(i) = round(precip_mean);
end

writetable(my_data, "USA Area and Annual Precipitation.txt",'Delimiter','tab');

