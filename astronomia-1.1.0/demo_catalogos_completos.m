function demo_catalogos_completos()
% DEMO_CATALOGOS_COMPLETOS Prueba todos los catálogos expandidos
  
  printf('=== DEMO CATÁLOGOS COMPLETOS v1.2.0 ===\n\n');
  
  % Verificar que los catálogos estén cargados
  printf('1. VERIFICANDO CATÁLOGOS...\n');
  
  % Cargar datos
  constelaciones = obtener_limites_constelaciones();
  estrellas = obtener_estrellas_brillantes();
  
  printf('   • Constelaciones cargadas: %d/88\n', length(constelaciones));
  printf('   • Estrellas brillantes: %d\n', length(estrellas));
  
  % Mostrar estadísticas
  printf('\n2. ESTADÍSTICAS DEL CATÁLOGO:\n');
  
  % Contar estrellas por constelación
  constelaciones_con_estrellas = unique({estrellas.constelacion});
  printf('   • Constelaciones con estrellas catalogadas: %d\n', length(constelaciones_con_estrellas));
  
  % Mostrar algunas constelaciones con más estrellas brillantes
  printf('   • Constelaciones más ricas:\n');
  conteo_estrellas = [];
  for i = 1:length(constelaciones_con_estrellas)
    count = sum(strcmp({estrellas.constelacion}, constelaciones_con_estrellas{i}));
    conteo_estrellas(i) = count;
  endfor
  
  [~, idx] = sort(conteo_estrellas, 'descend');
  for i = 1:min(5, length(idx))
    printf('     - %s: %d estrellas\n', constelaciones_con_estrellas{idx(i)}, conteo_estrellas(idx(i)));
  endfor
  
  % Probar búsqueda de constelación por coordenadas
  printf('\n3. PRUEBA DE IDENTIFICACIÓN:\n');
  constelacion_por_coordenadas(5.5, 5.0);   % Orión
  constelacion_por_coordenadas(18.5, 40.0); % Lyra
  constelacion_por_coordenadas(12.0, 50.0); % Ursa Major
  
  printf('\n✅ Demo de catálogos completos finalizada\n');
  printf('   El sistema está listo para la Fase 2: Visualización\n');
endfunction