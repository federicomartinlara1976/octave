function demo_constelaciones()
% DEMO_CONSTELACIONES Demostración del módulo

  printf('\n=== DEMO CONSTELACIONES ===\n');

  fecha = now();
  lat = 40.4168;  % Madrid
  lon = -3.7038;

  % 1. Identificar constelación por coordenadas
  printf('1. IDENTIFICACIÓN POR COORDENADAS:\n');
  constelacion_por_coordenadas(5.5, 5.0);   % Orión
  constelacion_por_coordenadas(11.0, 50.0); % Osa Mayor
  constelacion_por_coordenadas(20.5, 45.0); % Cygnus

  % 2. Constelaciones visibles
  printf('\n2. CONSTELACIONES VISIBLES:\n');
  constelaciones_visibles(fecha, lat, lon, 4.0);

  % 3. Información detallada
  printf('\n3. INFORMACIÓN DETALLADA:\n');
  info_constelacion('Orion');

  % 4. Estrellas brillantes
  printf('\n4. ESTRELLAS BRILLANTES:\n');
  estrellas_brillantes('Orion', 2.5);

  printf('\n✅ Demo constelaciones completada\n');
endfunction
