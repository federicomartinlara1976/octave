% --- altaz2hadec.m ---
% Funciones de conversión de coordenadas

function [ha, dec] = altaz2hadec(alt, az, lat)
% ALTAZ2HADEC Convierte coordenadas altazimutales a horarias
    alt_rad = deg2rad(alt);
    az_rad = deg2rad(az);
    lat_rad = deg2rad(lat);
    
    dec_rad = asin(sin(alt_rad) * sin(lat_rad) + ...
                   cos(alt_rad) * cos(lat_rad) * cos(az_rad));
    ha_rad = atan2(-sin(az_rad) * cos(alt_rad), ...
                   -cos(az_rad) * sin(lat_rad) * cos(alt_rad) + ...
                   sin(alt_rad) * cos(lat_rad));
    
    ha = rad2deg(ha_rad);
    dec = rad2deg(dec_rad);
endfunction
