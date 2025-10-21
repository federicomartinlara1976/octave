function inicializar_catalogo_completo()
% INICIALIZAR_CATALOGO_COMPLETO Genera todos los catálogos de la versión 1.2.0
  
  printf('=== INICIALIZACIÓN CATÁLOGO COMPLETO v1.2.0 ===\n\n');
  
  % 1. Constelaciones IAU completas
  printf('1. GENERANDO CATÁLOGO DE CONSTELACIONES...\n');
  generar_constelaciones_completas();
  
  % 2. Estrellas brillantes extendidas
  printf('\n2. GENERANDO CATÁLOGO DE ESTRELLAS...\n');
  generar_estrellas_brillantes_completas();
  
  % 3. Objetos de cielo profundo
  printf('\n3. GENERANDO CATÁLOGO DE OBJETOS PROFUNDOS...\n');
  generar_objetos_profundos();
  
  % Resumen final
  printf('\n=== RESUMEN DEL CATÁLOGO COMPLETO ===\n');
  printf('✅ Sistema de catálogos inicializado exitosamente\n');
  printf('   • 88 constelaciones IAU oficiales\n');
  printf('   • 50+ estrellas brillantes (magnitud ≤ 4.0)\n');
  printf('   • 30+ objetos de cielo profundo (Messier/NGC)\n');
  printf('   • Cobertura completa del cielo visible\n');
  printf('   • Datos listos para observación avanzada\n\n');
  
  printf('Los catálogos están disponibles en la carpeta datos/\n');
  printf('Usa: demo_catalogos_completos() para probar el sistema\n');
endfunction