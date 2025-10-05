% --- astro_todo_en_uno.m ---
% EJECUTAR: >> astro_todo_en_uno

% Limpiar todo primero
clear all;

% === FUNCIONES ===
function rad = deg2rad(deg)
    rad = deg * pi / 180;
end

function deg = rad2deg(rad)
    deg = rad * 180 / pi;
end

function [ha, dec] = altaz2hadec(alt, az, lat)
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
end

% === PROGRAMA PRINCIPAL ===
fprintf('\n=== OBSERVATORIO VIRTUAL ===\n');

% Tu ubicación (cambia estos valores)
mi_latitud = 40.4;    % Madrid
% mi_latitud = 41.4;  % Barcelona  
% mi_latitud = 37.4;  % Sevilla

altura = 45;
azimut = 180;

fprintf('Calculando para latitud: %.1f°\n', mi_latitud);
fprintf('Objeto en: Altura=%d°, Azimut=%d°\n', altura, azimut);

% Llamar a la función
[angulo_horario, declinacion] = altaz2hadec(altura, azimut, mi_latitud);

% Mostrar resultados
fprintf('\n--- RESULTADOS ---\n');
fprintf('Ángulo Horario: %.2f°\n', angulo_horario);
fprintf('Declinación:    %.2f°\n', declinacion);

% Ejemplo adicional
fprintf('\n--- EJEMPLO EXTRA ---\n');
fprintf('Objeto en el cenit (Alt=90°, Az=0°):\n');
[ha_cenit, dec_cenit] = altaz2hadec(90, 0, mi_latitud);
fprintf('Ángulo Horario: %.2f°\n', ha_cenit);
fprintf('Declinación:    %.2f°\n', dec_cenit);
fprintf('(Debería ser muy cercano a tu latitud: %.1f°)\n', mi_latitud);

fprintf('\n¡Todo funciona correctamente! 🎉\n');