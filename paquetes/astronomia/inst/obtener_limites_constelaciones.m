function datos = obtener_limites_constelaciones(forzar_recarga)
% OBTENER_LIMITES_CONSTELACIONES Sistema robusto con fallbacks
  
  persistent constelaciones_cache;
  
  if nargin == 1 && forzar_recarga
    constelaciones_cache = [];
    printf('🔄 Forzando recarga de constelaciones...\n');
  endif
  
  if isempty(constelaciones_cache)
    constelaciones_cache = cargar_constelaciones_robusto();
  endif
  
  datos = constelaciones_cache;
endfunction
