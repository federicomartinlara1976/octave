function demo_efemerides()
% DEMO_EFEMERIDES Demostración del módulo de efemérides

  printf('\n=== DEMO EFEMÉRIDES ===\n');

  % Fecha de hoy
  fecha_hoy = now();
  lat_madrid = 40.4168;
  lon_madrid = -3.7038;

  printf('Ubicación: Madrid (%.4f°N, %.4f°E)\n', lat_madrid, lon_madrid);
  printf('Fecha: %s\n\n', datestr(fecha_hoy));

  % 1. Efemérides solares (existente)
  printf('1. EFEMÉRIDES SOLARES:\n');
  try
    [salida, puesta] = salida_puesta_sol(fecha_hoy, lat_madrid, lon_madrid);
    if ~isnan(salida)
      printf('   Salida: %s\n', datestr(salida, 'HH:MM:SS'));
      printf('   Puesta: %s\n', datestr(puesta, 'HH:MM:SS'));
    endif
  catch
    printf('   Error calculando salida/puesta solar\n');
  end

  % 2. Duración del día
  printf('\n2. DURACIÓN DEL DÍA:\n');
  try
    duracion = duracion_dia(fecha_hoy, lat_madrid, lon_madrid);
  catch
    printf('   Error calculando duración del día\n');
  end

  % 3. NUEVO: Efemérides lunares
  printf('\n3. EFEMÉRIDES LUNARES:\n');
  try
    % Fase lunar
    [edad, nombre_fase] = fase_lunar(fecha_hoy);

    % Posición lunar
    [ra_luna, dec_luna, dist_luna, fase] = posicion_luna(fecha_hoy);

    % Salida y puesta lunar
    [salida_luna, puesta_luna] = salida_puesta_luna(fecha_hoy, lat_madrid, lon_madrid);
    if ~isnan(salida_luna)
      printf('   Salida Luna: %s\n', datestr(salida_luna, 'HH:MM:SS'));
      printf('   Puesta Luna: %s\n', datestr(puesta_luna, 'HH:MM:SS'));
    endif

    % Distancia angular Sol-Luna
    distancia_angular = distancia_sol_luna(fecha_hoy);

  catch err
    printf('   Error en efemérides lunares: %s\n', err.message);
  end

  % 4. Comparación estacional (existente)
  printf('\n4. COMPARACIÓN ESTACIONAL:\n');
  fechas_prueba = [
    datenum(2024, 6, 21);  % Solsticio verano
    datenum(2024, 12, 21); % Solsticio invierno
    datenum(2024, 3, 20);  % Equinoccio primavera
    datenum(2024, 9, 22)   % Equinoccio otoño
  ];

  nombres_fechas = {'Solsticio Verano', 'Solsticio Invierno', ...
                   'Equinoccio Primavera', 'Equinoccio Otoño'};

  for i = 1:length(fechas_prueba)
    try
      duracion = duracion_dia(fechas_prueba(i), lat_madrid, lon_madrid);
      printf('   %s: %.1f horas\n', nombres_fechas{i}, duracion);
    catch
      printf('   %s: Error\n', nombres_fechas{i});
    end
  end

  printf('\n✅ Demo efemérides completada\n');
endfunction
