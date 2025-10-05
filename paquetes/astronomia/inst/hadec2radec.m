% --- altaz2hadec.m ---
% Funciones de conversión de coordenadas

function [ra, dec] = hadec2radec(ha, dec_hadec, lst)
% HADEC2RADEC Convierte coordenadas horarias a ecuatoriales
    ra = mod(lst - ha/15, 24);
    dec = dec_hadec;
endfunction
