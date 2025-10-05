% --- calcular_lst.m ---
% Funciones de tiempo astronómico

function lst = calcular_lst(fecha, longitud)
% CALCULAR_LST Calcula el Tiempo Sidéreo Local
    jd = fecha + 2415018.5;
    t = (jd - 2451545.0) / 36525.0;
    gmst = 280.46061837 + 360.98564736629 * (jd - 2451545.0) + ...
           0.000387933 * t.*t - t.*t.*t / 38710000.0;
    lst = mod(gmst + longitud, 360) / 15;
endfunction
