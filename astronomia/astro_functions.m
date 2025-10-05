% --- astro_functions.m ---
function rad = deg2rad(deg)
    rad = deg * pi / 180;
end

function deg = rad2deg(rad)
    deg = rad * 180 / pi;
end

% Conversión Alt/Az a Horario/Dec
function [ha, dec] = altaz2hadec(alt, az, lat)
    alt_rad = deg2rad(alt);
    az_rad = deg2rad(az);
    lat_rad = deg2rad(lat);
    
    dec = asin(sin(alt_rad) * sin(lat_rad) + ...
               cos(alt_rad) * cos(lat_rad) * cos(az_rad));
    ha = atan2(-sin(az_rad) * cos(alt_rad), ...
               -cos(az_rad) * sin(lat_rad) * cos(alt_rad) + ...
               sin(alt_rad) * cos(lat_rad));
    
    ha = rad2deg(ha);
    dec = rad2deg(dec);
end

% Tiempo Sidéreo aproximado
function lst = local_sidereal_time(utc_time, longitude)
    % utc_time en formato datenum
    % longitude en grados (Este positivo)
    
    jd = utc_time + 2415018.5;  % Aproximación a Julian Date
    t = (jd - 2451545.0) / 36525.0;
    
    % Tiempo sidéreo en Greenwich
    gmst = 280.46061837 + 360.98564736629 * (jd - 2451545.0) + ...
           0.000387933 * t.*t - t.*t.*t / 38710000.0;
    
    % Ajustar a longitud local
    lst = mod(gmst + longitude, 360) / 15;  % Convertir a horas
end

% Conversión coordenadas horarias a ecuatoriales
function [ra, dec] = hadec2radec(ha, dec, lst)
    ra = mod(lst - ha/15, 24);  % ha en grados, convertir a horas
end