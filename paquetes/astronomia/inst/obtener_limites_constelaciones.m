function datos = obtener_limites_constelaciones()
% OBTENER_LIMITES_CONSTELACIONES Sistema híbrido con caché, CSV y descarga

  persistent constelaciones_cache;

  if isempty(constelaciones_cache)
    printf('🔭 Cargando datos de constelaciones...\n');
    constelaciones_cache = cargar_constelaciones_hibrido();
  endif

  datos = constelaciones_cache;
endfunction
