function [ra, dec, dist, fase] = posicion_luna(fecha)
% POSICION_LUNA Posición y fase de la Luna
%   [ra, dec, dist, fase] = posicion_luna(fecha)
%
%   Output:
%     ra    - Ascensión Recta en horas
%     dec   - Declinación en grados
%     dist  - Distancia en km
%     fase  - Fase lunar (0=nueva, 0.5=llena, 1=nueva)

  jd = fecha_juliana_efem(fecha);

  % Días desde época J2000.0
  T = (jd - 2451545.0) / 36525.0;

  % Longitud media de la Luna (simplificado)
  L = mod(218.3164477 + 481267.88123421 * T, 360);
  L_rad = deg2rad(L);

  % Anomalía media
  M = mod(134.9633964 + 477198.8675055 * T, 360);
  M_rad = deg2rad(M);

  % Argumento de la latitud
  F = mod(93.2720950 + 483202.0175233 * T, 360);
  F_rad = deg2rad(F);

  % Correcciones periódicas (simplificadas)
  lambda_luna = L_rad + deg2rad(6.289 * sin(M_rad));
  beta_luna = deg2rad(5.128 * sin(F_rad));

  % Oblicuidad de la eclíptica
  epsilon = deg2rad(23.43929111 - 0.013004167 * T);

  % Convertir a coordenadas ecuatoriales
  ra = atan2(cos(epsilon) * sin(lambda_luna) - tan(beta_luna) * sin(epsilon), cos(lambda_luna));
  dec = asin(sin(epsilon) * sin(lambda_luna) * cos(beta_luna) + cos(epsilon) * sin(beta_luna));

  % Convertir RA a horas
  ra_horas = mod(rad2deg(ra)/15, 24);
  dec_grados = rad2deg(dec);

  % Distancia (km) - aproximada
  dist_km = 385000 - 20905 * cos(M_rad) - 3699 * cos(2*F_rad - M_rad) - 2956 * cos(2*F_rad);

  % Fase lunar (0 = Luna nueva, 0.5 = Luna llena)
  fase = (1 - cos(M_rad)) / 2;

  ra = ra_horas;
  dec = dec_grados;
  dist = dist_km;

  printf('Posición de la Luna:\n');
  printf('  RA:  %.4f horas\n', ra_horas);
  printf('  Dec: %+.4f°\n', dec_grados);
  printf('  Dist: %.0f km\n', dist_km);
  printf('  Fase: %.1f%% iluminada\n', fase * 100);
endfunction
