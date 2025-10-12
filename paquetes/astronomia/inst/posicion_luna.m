function [ra, dec, dist, fase] = posicion_luna(fecha)
% POSICION_LUNA Posición y fase de la Luna (CORREGIDA)

  jd = fecha_juliana_efem(fecha);
  T = (jd - 2451545.0) / 36525.0;

  % Elementos orbitales (mejor precisión)
  L = mod(218.3164477 + 481267.88123421 * T, 360);
  M = mod(134.9633964 + 477198.8675055 * T, 360);
  F = mod(93.2720950 + 483202.0175233 * T, 360);

  L_rad = deg2rad(L);
  M_rad = deg2rad(M);
  F_rad = deg2rad(F);

  % Correcciones periódicas mejoradas
  lambda_luna = L_rad + deg2rad(6.2886 * sin(M_rad) + ...
                                1.2740 * sin(2*F_rad - M_rad) + ...
                                0.6583 * sin(2*F_rad) + ...
                                0.2136 * sin(2*M_rad));

  beta_luna = deg2rad(5.1280 * sin(F_rad) + ...
                      0.2806 * sin(M_rad + F_rad) + ...
                      0.2777 * sin(M_rad - F_rad) + ...
                      0.1732 * sin(2*F_rad - M_rad));

  % Oblicuidad
  epsilon = deg2rad(23.43929111 - 0.013004167 * T);

  % Coordenadas ecuatoriales
  ra = atan2(cos(epsilon) * sin(lambda_luna) - tan(beta_luna) * sin(epsilon), cos(lambda_luna));
  dec = asin(sin(epsilon) * sin(lambda_luna) * cos(beta_luna) + cos(epsilon) * sin(beta_luna));

  % Convertir
  ra_horas = mod(rad2deg(ra)/15, 24);
  dec_grados = rad2deg(dec);

  % Distancia (km)
  dist_km = 385000 - 20905 * cos(M_rad) - 3699 * cos(2*F_rad - M_rad) - 2956 * cos(2*F_rad);

  % FASE LUNAR CORREGIDA - basada en elongación
  % Elongación = diferencia longitud Luna - longitud Sol
  [ra_sol, dec_sol] = posicion_sol_simplificado(jd);
  ra_sol_rad = deg2rad(ra_sol * 15);

  elongacion = mod(rad2deg(lambda_luna) - rad2deg(ra_sol_rad), 360);
  fase = (1 - cosd(elongacion)) / 2;  % 0=nueva, 0.5=llena, 1=nueva

  ra = ra_horas;
  dec = dec_grados;
  dist = dist_km;

  printf('Posición de la Luna:\n');
  printf('  RA:  %.4f horas\n', ra_horas);
  printf('  Dec: %+.4f°\n', dec_grados);
  printf('  Dist: %.0f km\n', dist_km);
  printf('  Fase: %.0f%% iluminada\n', fase * 100);
endfunction
