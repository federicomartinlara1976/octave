function [salida, puesta] = salida_puesta_sol(fecha, lat, lon)
% SALIDA_PUESTA_SOL Calcula salida y puesta del Sol (CORREGIDO)

  lat_rad = deg2rad(lat);
  jd = fecha_juliana_efem(fecha);

  % Posición del Sol
  [ra_sol, dec_sol] = posicion_sol_simplificado(jd);
  dec_rad = deg2rad(dec_sol);

  % Altura estándar del Sol en horizonte
  h0 = deg2rad(-0.8333);

  cos_omega0 = (sin(h0) - sin(lat_rad) * sin(dec_rad)) / (cos(lat_rad) * cos(dec_rad));

  if abs(cos_omega0) > 1
    salida = NaN; puesta = NaN;
    return;
  endif

  omega0 = acos(cos_omega0);

  % Tiempo sidéreo en Greenwich (grados)
  T = (jd - 2451545.0) / 36525.0;
  theta0 = 280.46061837 + 360.98564736629 * (jd - 2451545.0) + ...
           0.000387933 * T.*2 - T.^3 / 38710000.0;
  theta0 = mod(theta0, 360);

  % Convertir RA a grados
  ra_grados = ra_sol * 15;

  % Ángulo horario en grados
  H_salida = -rad2deg(omega0);
  H_puesta = rad2deg(omega0);

  % Tiempo universal (horas)
  TU_salida = mod((H_salida + ra_grados - theta0 + lon) / 15, 24);
  TU_puesta = mod((H_puesta + ra_grados - theta0 + lon) / 15, 24);

  % Asegurar orden correcto
  if TU_salida > TU_puesta
    % Intercambiar si están invertidos
    temp = TU_salida;
    TU_salida = TU_puesta;
    TU_puesta = temp;
  endif

  % Convertir a datenum
  fecha_base = floor(fecha);
  salida = fecha_base + TU_salida/24;
  puesta = fecha_base + TU_puesta/24;

  printf('Salida del Sol: %s\n', datestr(salida, 'HH:MM:SS'));
  printf('Puesta del Sol:  %s\n', datestr(puesta, 'HH:MM:SS'));
endfunction
