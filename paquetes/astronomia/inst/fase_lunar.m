function [edad, nombre_fase, iluminacion] = fase_lunar(fecha)
% FASE_LUNAR Calcula la fase lunar (CORREGIDO)

  jd = fecha_juliana_efem(fecha);
  dias_ciclo = 29.530588853;
  ultima_luna_nueva = 2451549.5;

  edad = mod(jd - ultima_luna_nueva, dias_ciclo);

  % Calcular iluminación precisa
  angulo_fase = (edad / dias_ciclo) * 360;
  iluminacion = (1 - cosd(angulo_fase)) / 2 * 100;

  % Determinar fase
  if edad < 1 || edad > 28.5
    nombre_fase = 'Luna nueva';
  elseif edad < 7.4
    nombre_fase = 'Luna creciente';
  elseif edad < 14.8
    nombre_fase = 'Luna llena';
  elseif edad < 22.1
    nombre_fase = 'Luna menguante';
  else
    nombre_fase = 'Luna nueva';
  endif

  printf('Fase lunar: %s (%.1f días, %.0f%% iluminada)\n', ...
         nombre_fase, edad, iluminacion);
endfunction
