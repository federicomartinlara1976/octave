function demo_efemerides()
% DEMO_EFEMERIDES Demostración corregida

  printf('\n=== DEMO EFEMÉRIDES (CORREGIDA) ===\n');

  fecha_hoy = now();
  lat_madrid = 40.4168;
  lon_madrid = -3.7038;

  printf('Ubicación: Madrid (%.4f°N, %.4f°E)\n', lat_madrid, lon_madrid);
  printf('Fecha: %s\n\n', datestr(fecha_hoy));

  % 1. Efemérides solares
  printf('1. EFEMÉRIDES SOLARES:\n');
  try
    [salida, puesta] = salida_puesta_sol(fecha_hoy, lat_madrid, lon_madrid);
    duracion = duracion_dia(fecha_hoy, lat_madrid, lon_madrid);
  catch err
    printf('   Error: %s\n', err.message);
  end

  % 2. Posición del Sol
  printf('\n2. POSICIÓN SOLAR:\n');
  try
    [ra_sol, dec_sol, dist_sol] = posicion_sol(fecha_hoy);
  catch err
    printf('   Error: %s\n', err.message);
  end

  % 3. Efemérides lunares
  printf('\n3. EFEMÉRIDES LUNARES:\n');
  try
    [edad, nombre_fase, iluminacion] = fase_lunar(fecha_hoy);
    [ra_luna, dec_luna, dist_luna, fase] = posicion_luna(fecha_hoy);
    [salida_luna, puesta_luna] = salida_puesta_luna(fecha_hoy, lat_madrid, lon_madrid);

    if ~isnan(salida_luna)
      printf('   Salida Luna: %s\n', datestr(salida_luna, 'HH:MM:SS'));
      printf('   Puesta Luna:  %s\n', datestr(puesta_luna, 'HH:MM:SS'));
    endif

  catch err
    printf('   Error: %s\n', err.message);
  end

  printf('\n✅ Demo efemérides completada\n');
endfunction

