function datos = cargar_constelaciones_robusto()
% CARGAR_CONSTELACIONES_ROBUSTO Sistema simple y confiable
  
  % 1. PRIORIDAD: Archivo CSV local generado
  archivo_csv = 'datos/constelaciones_iau_completas.csv';
  printf('🔭 Cargando datos de constelaciones de %s...\n', archivo_csv);
  
  if exist(archivo_csv, 'file')
    printf('   Leyendo archivo local CSV...\n');
    datos = leer_csv_constelaciones(archivo_csv);
    if length(datos) >= 80
      printf('   ✓ Catálogo completo cargado (%d constelaciones)\n', length(datos));
      return;
    endif
  endif
  
  % 2. GENERAR base de datos si no existe
  printf('   Generando base de datos completa...\n');
  generar_constelaciones_completas();
  datos = leer_csv_constelaciones(archivo_csv);
endfunction