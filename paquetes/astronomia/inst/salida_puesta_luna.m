function [salida, puesta] = salida_puesta_luna(fecha, lat, lon)
% SALIDA_PUESTA_LUNA Calcula salida y puesta de la Luna
%   [salida, puesta] = salida_puesta_luna(fecha, lat, lon)
%
%   Input:
%     fecha - Fecha en formato datenum
%     lat   - Latitud en grados
%     lon   - Longitud en grados
%
%   Output:
%     salida - Hora de salida de la Luna (datenum)
%     puesta - Hora de puesta de la Luna (datenum)

  % Obtener posición lunar
  [ra_luna, dec_luna, ~, ~] = posicion_luna(fecha);

  % Cálculo similar al Sol pero con paralaje lunar
  lat_rad = deg2rad(lat);
  dec_rad = deg2rad(dec_luna);

  % Paralaje horizontal lunar (aproximadamente 1°)
  h0 = deg2rad(-0.8333 - 0.575);  % Altura con corrección por paralaje

  cos_omega0 = (sin(h0) - sin(lat_rad) * sin(dec_rad)) / (cos(lat_rad) * cos(dec_rad));

  if abs(cos_omega0) > 1
    salida = NaN; puesta = NaN;
    printf('Luna siempre visible o nunca visible en esta fecha\n');
    return;
  endif

  omega0 = acos(cos_omega0);

  % Tiempo sidéreo en Greenwich
  jd = fecha_juliana_efem(fecha);
  theta0 = 280.46061837 + 360.98564736629 * (jd - 2451545.0);
  theta0 = mod(theta0, 360);

  % Tiempo universal de salida/puesta
  ra_horas = ra_luna;  % Ya está en horas
  ra_grados = ra_horas * 15;

  t_salida = theta0 - rad2deg(omega0) - lon - ra_grados;
  t_puesta = theta0 + rad2deg(omega0) - lon - ra_grados;

  % Convertir a horas y luego a datenum
  salida_horas = mod(t_salida/15, 24);
  puesta_horas = mod(t_puesta/15, 24);

  % Convertir a datenum
  fecha_base = floor(fecha);
  salida = fecha_base + salida_horas/24;
  puesta = fecha_base + puesta_horas/24;

  printf('Salida de la Luna: %s\n', datestr(salida));
  printf('Puesta de la Luna:  %s\n', datestr(puesta));
endfunction
