function estrellas = obtener_estrellas_brillantes()
% OBTENER_ESTRELLAS_BRILLANTES Sistema robusto para estrellas
  
  persistent estrellas_cache;
  
  if isempty(estrellas_cache)
    printf('   Cargando catálogo de estrellas...\n');
    estrellas_cache = cargar_estrellas_robusto();
  endif
  
  estrellas = estrellas_cache;
endfunction