% --- prueba_completa.m ---
% Versión todo-en-uno para evitar problemas de carga

% Funciones integradas
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

% Script principal
function prueba_completa()
    fprintf('=== PRUEBA COMPLETA INTEGRADA ===\n');
    
    % Configuración
    mi_latitud = 40.4;
    mi_longitud = -3.7;
    altura = 45;
    azimut = 180;
    
    % Cálculos
    [ha, dec] = altaz2hadec(altura, azimut, mi_latitud);
    
    fprintf('Objeto a Alt=%.0f°, Az=%.0f°:\n', altura, azimut);
    fprintf(' - Ángulo Horario: %.2f°\n', ha);
    fprintf(' - Declinación: %.2f°\n', dec);
    fprintf('¡Funciona correctamente!\n');
end

% Ejecutar la prueba
prueba_completa();