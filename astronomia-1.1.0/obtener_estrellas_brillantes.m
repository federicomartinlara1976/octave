function estrellas = obtener_estrellas_brillantes()
% OBTENER_ESTRELLAS_BRILLANTES Sistema robusto para estrellas
  
  persistent estrellas_cache;
  
  if isempty(estrellas_cache)
    printf('   Cargando catálogo de estrellas...\n');
    estrellas_cache = cargar_estrellas_robusto();
  endif
  
  estrellas = estrellas_cache;
endfunction

function estrellas = cargar_estrellas_robusto()
% CARGAR_ESTRELLAS_ROBUSTO Carga o genera catálogo de estrellas
  
  archivo_csv = 'datos/estrellas_brillantes_completas.csv';
  
  if exist(archivo_csv, 'file')
    estrellas = leer_csv_estrellas(archivo_csv);
    if length(estrellas) >= 20
      return;
    endif
  endif
  
  % Generar catálogo si no existe
  generar_estrellas_brillantes_completas();
  estrellas = leer_csv_estrellas(archivo_csv);
endfunction