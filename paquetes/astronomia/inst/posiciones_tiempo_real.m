function posiciones_tiempo_real(lat, lon, objetos_seguimiento)
% POSICIONES_TIEMPO_REAL Muestra posiciones actuales de objetos celestes
%   posiciones_tiempo_real(40.4, -3.7, {'Moon', 'Mars', 'Jupiter', 'Saturn'})

  if nargin < 3
    objetos_seguimiento = {'Moon', 'Mars', 'Jupiter', 'Saturn', 'Venus'};
  endif

  fecha = now();
  printf('=== POSICIONES EN TIEMPO REAL ===\n');
  printf('Fecha: %s\n', datestr(fecha));
  printf('Ubicación: %.1f°N, %.1f°E\n\n', lat, lon);
  
  lst = calcular_lst(fecha, lon);
  printf('Tiempo Sidéreo Local: %.4f horas\n\n', lst);
  
  % Posición del Sol
  [ra_sol, dec_sol, dist_sol] = posicion_sol(fecha);
  printf('🌞 SOL:\n');
  printf('   RA: %.4f h, Dec: %+.4f°, Dist: %.6f UA\n', ra_sol, dec_sol, dist_sol);
  printf('   Altura: %.1f°\n', altura_objeto(ra_sol, dec_sol, lst, lat));
  
  % Posición de la Luna
  [ra_luna, dec_luna, dist_luna, fase_luna] = posicion_luna(fecha);
  printf('\n🌙 LUNA:\n');
  printf('   RA: %.4f h, Dec: %+.4f°, Dist: %.0f km\n', ra_luna, dec_luna, dist_luna);
  printf('   Fase: %.1f%%, Altura: %.1f°\n', fase_luna * 100, altura_objeto(ra_luna, dec_luna, lst, lat));
  
  % Planetas
  printf('\n🪐 PLANETAS:\n');
  for i = 1:length(objetos_seguimiento)
    planeta = objetos_seguimiento{i};
    [ra, dec, dist] = posicion_planeta_simple(planeta, fecha);
    if ~isnan(ra)
      altura = altura_objeto(ra, dec, lst, lat);
      printf('   %-8s: RA=%.2fh, Dec=%+.1f°, Altura=%.1f°\n', ...
             planeta, ra, dec, altura);
    endif
  endfor
  
  % Constelación en culminación
  printf('\n📡 EN CULMINACIÓN:\n');
  const_culminacion = constelacion_por_coordenadas(lst, 0);
  printf('   %s (meridiano local)\n', const_culminacion);
  
  % Mejores objetos para observar ahora
  printf('\n🔭 RECOMENDACIONES DE OBSERVACIÓN:\n');
  generar_recomendaciones_observacion(lst, lat, lon);
endfunction