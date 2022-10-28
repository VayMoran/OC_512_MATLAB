close all
clear all
clc

sum_geo = zeros("double")
map_struct = dir('*.asc')

for map = 1:size(map_struct)
    % Read map data, store info as geographic and double point into A
    [A,R] = readgeoraster(map_struct(map).name,'CoordinateSystemType','geographic','OutputType','double')
    % Add each map data together
    if sum_geo == zeros("double")
        sum_geo = size(A)   % Assing matrix size of georaster data
        sum_geo = A
    else
        sum_geo = plus(sum_geo,A)
    end
end

% Creation of Main figure
main_figure =figure('Name','Total Precipitation in Oregon: 1983')
% Pulling lat and long data out of created R
latlim = R.LatitudeLimits
longlim = R.LongitudeLimits
% Create projected US map with long lat on lambert conformal conic
% projection
usamap(latlim,longlim)
% Create a map using added precipitation data on a contour map
my_map = geoshow(sum_geo,R,'DisplayType','contour','LevelList',[0:200:5000])
my_colorbar = colorbar
my_colorbar.Label.String = "Precipitation"
title('Total Precipitation in Oregon: 1983')

print -dpng -r300 or_precip_1983.png

