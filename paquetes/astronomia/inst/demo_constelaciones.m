function demo_constelaciones()
% DEMO_CONSTELACIONES Demostración con sistema mejorado

  printf('\n=== DEMO CONSTELACIONES (SISTEMA HÍBRIDO) ===\n');

  % Inicializar sistema
  inicializar_constelaciones();

  % Resto de la demo igual...
  fecha = now();
  lat = 40.4168;
  lon = -3.7038;

  printf('\n1. CONSTELACIONES VISIBLES:\n');
  constelaciones_visibles(fecha, lat, lon, 4.0);

  printf('\n2. INFORMACIÓN DETALLADA:\n');
  info_constelacion('Orion');
endfunction
