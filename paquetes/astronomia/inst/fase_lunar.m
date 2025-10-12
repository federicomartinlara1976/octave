function [edad, nombre_fase] = fase_lunar(fecha)
% FASE_LUNAR Calcula la fase lunar y su nombre
%   [edad, nombre_fase] = fase_lunar(fecha)
%
%   Output:
%     edad       - Edad de la Luna en días
%     nombre_fase- Nombre de la fase lunar

  jd = fecha_juliana_efem(fecha);

  % Días desde Luna nueva (aproximación simplificada)
  dias_ciclo = 29.530588853;
  ultima_luna_nueva = 2451549.5;  % Luna nueva cerca de J2000.0

  edad = mod(jd - ultima_luna_nueva, dias_ciclo);

  % Determinar fase
  if edad < 1 || edad > 28.5
    nombre_fase = 'Luna nueva';
    iluminacion = 0;
  elseif edad < 7.4
    nombre_fase = 'Luna creciente';
    iluminacion = edad / 7.4 * 50;
  elseif edad < 14.8
    nombre_fase = 'Luna llena';
    iluminacion = 100;
  elseif edad < 22.1
    nombre_fase = 'Luna menguante';
    iluminacion = 100 - (edad - 14.8) / 7.3 * 50;
  else
    nombre_fase = 'Luna nueva';
    iluminacion = 0;
  endif

  printf('Fase lunar: %s (%.1f días, %.0f%% iluminada)\n', ...
         nombre_fase, edad, iluminacion);
endfunction
