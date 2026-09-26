function demo_constelaciones()
% DEMO_CONSTELACIONES Demostración del sistema corregido
  
  printf('\n=== DEMO CONSTELACIONES (SISTEMA CORREGIDO) ===\n');
  
  % Inicializar sistema de forma simple
  printf('Inicializando sistema...\n');
  constelaciones = obtener_limites_constelaciones();
  estrellas = obtener_estrellas_brillantes();
  
  printf('Sistema cargado: %d constelaciones, %d estrellas\n\n', ...
         length(constelaciones), length(estrellas));
  
  fecha = now();
  lat = 40.4168;
  lon = -3.7038;
  
  % 1. Identificación por coordenadas
  printf('1. IDENTIFICACIÓN POR COORDENADAS:\n');
  constelacion_por_coordenadas(5.5, 5.0);   % Orión
  constelacion_por_coordenadas(18.5, 40.0); % Lyra
  constelacion_por_coordenadas(12.0, 50.0); % Ursa Major
  
  % 2. Constelaciones visibles
  printf('\n2. CONSTELACIONES VISIBLES AHORA:\n');
  constelaciones_visibles(fecha, lat, lon, 4.0);
  
  % 3. Información detallada
  printf('\n3. INFORMACIÓN DETALLADA:\n');
  info_constelacion('Orion');
  
  printf('\n✅ Demo completada correctamente\n');
endfunction