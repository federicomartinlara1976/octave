function inicializar_constelaciones()
% INICIALIZAR_CONSTELACIONES Prepara sistema de constelaciones

  printf('\n=== INICIALIZACIÓN CONSTELACIONES ===\n');

  % Forzar carga inicial
  datos = obtener_limites_constelaciones();

  % Verificar que tenemos datos suficientes
  if length(datos) < 50
    printf('⚠️  Datos limitados. Considera:\n');
    printf('   1. Ejecutar: generar_constelaciones_completas()\n');
    printf('   2. Verificar conexión a internet para descarga automática\n');
  else
    printf('✅ Sistema de constelaciones listo (%d constelaciones)\n', length(datos));
  endif
endfunction
