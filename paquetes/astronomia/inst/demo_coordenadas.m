% --- altaz2hadec.m ---
% Funciones de conversión de coordenadas

function demo_coordenadas()
% DEMO_COORDENADAS Demostración de coordenadas
    printf('\n--- DEMO COORDENADAS ---\n');
    lat = 40.4; lon = -3.7;
    
    printf('1. Objeto en el cenit:\n');
    [ha, dec] = altaz2hadec(90, 0, lat);
    printf('   HA = %.2f°, Dec = %.2f°\n', ha, dec);
    
    printf('2. Conversión completa:\n');
    [ra, dec] = altaz2radec(45, 180, lat, lon, now());
    printf('   RA = %.2fh, Dec = %.2f°\n', ra, dec);
endfunction 
