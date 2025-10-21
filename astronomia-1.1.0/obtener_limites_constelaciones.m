function datos = obtener_limites_constelaciones()
% OBTENER_LIMITES_CONSTELACIONES Sistema robusto con fallbacks
  
  persistent constelaciones_cache;
  
  if isempty(constelaciones_cache)
    printf('🔭 Cargando datos de constelaciones...\n');
    constelaciones_cache = cargar_constelaciones_robusto();
  endif
  
  datos = constelaciones_cache;
endfunction
