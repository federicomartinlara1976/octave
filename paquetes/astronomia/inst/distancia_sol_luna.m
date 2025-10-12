function distancia_angular = distancia_sol_luna(fecha)
% DISTANCIA_SOL_LUNA Distancia angular entre Sol y Luna
%   distancia_angular = distancia_sol_luna(fecha)
%
%   Output:
%     distancia_angular - Distancia en grados

  % Posición del Sol
  [ra_sol, dec_sol] = posicion_sol(fecha);
  ra_sol_rad = deg2rad(ra_sol * 15);
  dec_sol_rad = deg2rad(dec_sol);

  % Posición de la Luna
  [ra_luna, dec_luna] = posicion_luna(fecha);
  ra_luna_rad = deg2rad(ra_luna * 15);
  dec_luna_rad = deg2rad(dec_luna);

  % Fórmula del coseno para distancia angular
  cos_dist = sin(dec_sol_rad) * sin(dec_luna_rad) + ...
             cos(dec_sol_rad) * cos(dec_luna_rad) * cos(ra_sol_rad - ra_luna_rad);

  distancia_angular = rad2deg(acos(cos_dist));

  printf('Distancia angular Sol-Luna: %.1f°\n', distancia_angular);

  % Interpretación
  if distancia_angular < 5
    printf('  → Posible eclipse solar\n');
  elseif distancia_angular > 175
    printf('  → Posible eclipse lunar\n');
  endif
endfunction
