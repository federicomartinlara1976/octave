function inicializar_sistema_simple()
% INICIALIZAR_SISTEMA_SIMPLE Inicialización robusta sin dependencias externas
  
  printf('=== INICIALIZACIÓN SISTEMA CONSTELACIONES ===\n\n');
  
  % Crear directorio datos si no existe
  if ~exist('datos', 'dir')
    mkdir('datos');
    printf('📁 Carpeta datos/ creada\n');
  endif
  
  % 1. Generar constelaciones
  printf('1. GENERANDO CONSTELACIONES...\n');
  if ~exist('datos/constelaciones_iau_completas.csv', 'file')
    generar_constelaciones_completas();
  else
    printf('   ✓ Catálogo de constelaciones ya existe\n');
  endif
  
  % 2. Generar estrellas
  printf('\n2. GENERANDO ESTRELLAS...\n');
  if ~exist('datos/estrellas_brillantes_completas.csv', 'file')
    generar_estrellas_brillantes_completas();
  else
    printf('   ✓ Catálogo de estrellas ya existe\n');
  endif
  
  % 3. Generar objetos profundos
  printf('\n3. GENERANDO OBJETOS PROFUNDOS...\n');
  if ~exist('datos/objetos_profundos.csv', 'file')
    generar_objetos_profundos();
  else
    printf('   ✓ Catálogo de objetos profundos ya existe\n');
  endif
  
  % 4. Cargar y verificar
  printf('\n4. VERIFICANDO SISTEMA...\n');
  constelaciones = obtener_limites_constelaciones();
  estrellas = obtener_estrellas_brillantes();
  
  printf('   • Constelaciones: %d/88 cargadas\n', length(constelaciones));
  printf('   • Estrellas: %d cargadas\n', length(estrellas));
  
  printf('\n✅ SISTEMA INICIALIZADO CORRECTAMENTE\n');
  printf('   Los catálogos están listos para usar\n');
  printf('   Ejecuta demo_catalogos_completos() para probar\n');
endfunction