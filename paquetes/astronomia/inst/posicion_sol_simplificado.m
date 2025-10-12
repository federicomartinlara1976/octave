function [ra, dec] = posicion_sol_simplificado(jd)
% POSICION_SOL_SIMPLIFICADO Versión simplificada para salida/puesta

  n = jd - 2451545.0;

  % Longitud media
  L = mod(280.46646 + 0.98564736 * n, 360);

  % Anomalía media
  g = deg2rad(mod(357.52772 + 0.98560028 * n, 360));

  % Ecuación del centro
  C = deg2rad(1.91474 * sin(g) + 0.02002 * sin(2*g) + 0.00029 * sin(3*g));

  % Longitud verdadera
  lambda_true = deg2rad(L + C);

  % Oblicuidad
  epsilon = deg2rad(23.43929 - 0.00000036 * n);

  % Coordenadas ecuatoriales
  ra = atan2(cos(epsilon) * sin(lambda_true), cos(lambda_true));
  dec = asin(sin(epsilon) * sin(lambda_true));

  % Convertir RA a horas
  ra = mod(rad2deg(ra)/15, 24);
  dec = rad2deg(dec);
endfunction
