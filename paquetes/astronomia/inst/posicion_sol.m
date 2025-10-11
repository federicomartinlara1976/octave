function [ra, dec, dist] = posicion_sol(fecha)
% POSICION_SOL Posición precisa del Sol
%   [ra, dec, dist] = posicion_sol(fecha)

  jd = fecha_juliana_efem(fecha);
  n = jd - 2451545.0;

  % Longitud media del Sol
  L = mod(280.46646 + 0.98564736 * n, 360);

  % Anomalía media
  g = deg2rad(mod(357.52772 + 0.98560028 * n, 360));

  % Ecuación del centro
  C = deg2rad(1.91474 * sin(g) + 0.02002 * sin(2*g) + 0.00029 * sin(3*g));

  % Longitud verdadera
  lambda_true = deg2rad(L + C);

  % Oblicuidad de la eclíptica
  epsilon = deg2rad(23.43929 - 0.00000036 * n);

  % Ascensión Recta y Declinación
  ra = atan2(cos(epsilon) * sin(lambda_true), cos(lambda_true));
  dec = asin(sin(epsilon) * sin(lambda_true));

  % Distancia (UA)
  R = 1.00014 - 0.01671 * cos(g) - 0.00014 * cos(2*g);
  dist = R;

  % Convertir RA a horas
  ra_horas = mod(rad2deg(ra)/15, 24);
  dec_grados = rad2deg(dec);

  printf('Posición del Sol:\n');
  printf('  RA:  %.4f horas\n', ra_horas);
  printf('  Dec: %+.4f°\n', dec_grados);
  printf('  Dist: %.6f UA\n', dist);
endfunction
