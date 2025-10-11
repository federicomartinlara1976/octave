function demo_efemerides()
% DEMO_EFEMERIDES Demostración del módulo de efemérides

  printf('\n=== DEMO EFEMÉRIDES ===\n');

  % Fecha de hoy
  fecha_hoy = now();
  lat_madrid = 40.4168;
  lon_madrid = -3.7038;

  printf('Ubicación: Madrid (%.4f°N, %.4f°E)\n', lat_madrid, lon_madrid);
  printf('Fecha: %s\n\n', datestr(fecha_hoy));

  % 1. Salida y puesta del Sol
  printf('1. SALIDA Y PUESTA DEL SOL:\n');
  try
    [salida, puesta] = salida_puesta_sol(fecha_hoy, lat_madrid, lon_madrid);
    if ~isnan(salida)
      printf('   Salida: %s\n', datestr(salida, 'HH:MM:SS'));
      printf('   Puesta: %s\n', datestr(puesta, 'HH:MM:SS'));
    endif
  catch
    printf('   Error calculando salida/puesta\n');
  end

  % 2. Duración del día
  printf('\n2. DURACIÓN DEL DÍA:\n');
  try
    duracion = duracion_dia(fecha_hoy, lat_madrid, lon_madrid);
  catch
    printf('   Error calculando duración del día\n');
  end

  % 3. Posición del Sol
  printf('\n3. POSICIÓN DEL SOL:\n');
  try
    [ra, dec, dist] = posicion_sol(fecha_hoy);
  catch
    printf('   Error calculando posición solar\n');
  end

  % 4. Prueba con diferentes fechas
  printf('\n4. EFEMÉRIDES EN DIFERENTES FECHAS:\n');
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
