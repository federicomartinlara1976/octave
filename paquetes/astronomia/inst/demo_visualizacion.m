function demo_visualizacion()
% DEMO_VISUALIZACION Demuestra todas las herramientas de visualización
  
  printf('=== DEMO HERRAMIENTAS DE VISUALIZACIÓN ===\n\n');
  
  fecha = now();
  lat = 40.4168;
  lon = -3.7038;
  
  printf('Ubicación: %.1f°N, %.1f°E\n', lat, lon);
  printf('Fecha: %s\n\n', datestr(fecha));
  
  % 1. Mapa estelar simple
  printf('1. GENERANDO MAPA ESTELAR...\n');
  mapa_estelar_simple(fecha, lat, lon, 3.0, {'Orion', 'Ursa Major'});
  
  % 2. Constelación específica
  printf('\n2. DIBUJANDO CONSTELACIÓN ESPECÍFICA...\n');
  dibujar_constelacion('Orion', fecha, lat, lon);
  
  % 3. Posiciones en tiempo real
  printf('\n3. CALCULANDO POSICIONES ACTUALES...\n');
  posiciones_tiempo_real(lat, lon);
  
  % 4. Visualizador 3D
  printf('\n4. INICIANDO VISUALIZADOR 3D...\n');
  visualizador_3d(fecha, lat, lon);
  
  printf('\n✅ Demo de visualización completada\n');
  printf('   Se han abierto 4 ventanas de visualización\n');
endfunction