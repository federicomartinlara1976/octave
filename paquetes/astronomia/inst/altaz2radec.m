% --- altaz2hadec.m ---
% Funciones de conversión de coordenadas

function [ra, dec] = altaz2radec(alt, az, lat, lon, fecha)
% ALTAZ2RADEC Convierte directamente de alt/az a RA/Dec
    [ha, dec] = altaz2hadec(alt, az, lat);
    lst = calcular_lst(fecha, lon);
    [ra, dec] = hadec2radec(ha, dec, lst);
endfunction
