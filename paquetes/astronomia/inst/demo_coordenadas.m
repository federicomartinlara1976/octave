% --- altaz2hadec.m ---
% Funciones de conversión de coordenadas

function demo_coordenadas()
% DEMO_COORDENADAS Demostración de coordenadas
    printf('\n--- DEMO COORDENADAS ---\n');
    lat = 40.4; lon = -3.7;
    
    printf('1. Objeto en el cenit:\n');
    result = altaz2hadec(90, 0, lat);
    printf('   HA = %.2f°, Dec = %.2f°\n', result(1), result(2));
    
    printf('2. Conversión completa:\n');
    result = altaz2radec(45, 180, lat, lon, now());
    printf('   RA = %.2fh, Dec = %.2f°\n', result(1), result(2));
endfunction 
