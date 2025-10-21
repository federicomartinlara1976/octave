function datos = cargar_constelaciones_hibrido()
% CARGAR_CONSTELACIONES_HIBRIDO Intenta cargar por prioridad

  % 1. PRIORIDAD: Archivo CSV local
  archivo_csv = 'datos/constelaciones_iau.csv';
  if exist(archivo_csv, 'file')
    printf('   Leyendo archivo local CSV...\n');
    datos = leer_csv_constelaciones(archivo_csv);
    return;
  endif

  % 2. SEGUNDA OPCIÓN: Descargar de repositorio público
  printf('   Descargando datos de repositorio público...\n');
  [exito, datos] = descargar_datos_publicos();
  if exito
    % Guardar localmente para próxima vez
    guardar_constelaciones_csv(datos, archivo_csv);
    return;
  endif

  % 3. FALLBACK: Datos básicos en memoria
  printf('   Usando datos básicos en memoria...\n');
  datos = obtener_constelaciones_basicas();
endfunction
