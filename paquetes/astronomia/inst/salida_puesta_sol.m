function [salida, puesta] = salida_puesta_sol(fecha, lat, lon)
% SALIDA_PUESTA_SOL Calcula salida y puesta del Sol
%   [salida, puesta] = salida_puesta_sol(fecha, lat, lon)
%
%   Input:
%     fecha - Fecha en formato datenum
%     lat   - Latitud en grados
%     lon   - Longitud en grados
%
%   Output:
%     salida - Hora de salida del Sol (datenum)
%     puesta - Hora de puesta del Sol (datenum)

  % Conversión a radianes
  lat_rad = deg2rad(lat);

  % Fecha Juliana
  jd = fecha_juliana_efem(fecha);

  % Cálculo simplificado (aproximación de Meeus)
  n = jd - 2451545.0;
  L = mod(280.460 + 0.9856474 * n, 360);
  g = deg2rad(mod(357.528 + 0.9856003 * n, 360));

  % Longitud eclíptica del Sol
  lambda = deg2rad(L + 1.915 * sin(g) + 0.020 * sin(2*g));

  % Oblicuidad de la eclíptica
  epsilon = deg2rad(23.439 - 0.0000004 * n);

  % Ascensión Recta y Declinación
  ra = atan2(cos(epsilon) * sin(lambda), cos(lambda));
  dec = asin(sin(epsilon) * sin(lambda));

  % Cálculo de salida/puesta (simplificado)
  h0 = deg2rad(-0.8333);  % Altura del centro del Sol en horizonte
  cos_omega0 = (sin(h0) - sin(lat_rad) * sin(dec)) / (cos(lat_rad) * cos(dec));

  if abs(cos_omega0) > 1
    % Sol de medianoche o noche polar
    if lat > 0
      salida = NaN; puesta = NaN;
      printf('Sol de medianoche en esta fecha/latitud\n');
    else
      salida = NaN; puesta = NaN;
      printf('Noche polar en esta fecha/latitud\n');
    endif
    return;
  endif

  omega0 = acos(cos_omega0);

  % Tiempo sidéreo en Greenwich
  theta0 = 280.46061837 + 360.98564736629 * (jd - 2451545.0);
  theta0 = mod(theta0, 360);

  % Tiempo universal de salida/puesta
  t_salida = theta0 - rad2deg(omega0) - lon - rad2deg(ra);
  t_puesta = theta0 + rad2deg(omega0) - lon - rad2deg(ra);

  % Convertir a horas y luego a datenum
  salida_horas = mod(t_salida/15, 24);
  puesta_horas = mod(t_puesta/15, 24);

  % Convertir a datenum (mantener fecha base)
  fecha_base = floor(fecha);
  salida = fecha_base + salida_horas/24;
  puesta = fecha_base + puesta_horas/24;

  printf('Salida del Sol: %s\n', datestr(salida));
  printf('Puesta del Sol:  %s\n', datestr(puesta));
endfunction
