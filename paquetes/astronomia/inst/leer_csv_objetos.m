function objetos = leer_csv_objetos(archivo)
% LEER_CSV_OBJETOS Lee un archivo CSV con objetos de cielo profundo

  % Verificar si el archivo existe
  if ~exist(archivo, 'file')
    warning('Archivo %s no encontrado. Usando datos de ejemplo.', archivo);
    objetos = crear_objetos_ejemplo();
    return;
  endif

  fid = -1;  % Inicializar con valor inválido
  
  try
    % Leer el archivo como texto para manejar datos mixtos
    fid = fopen(archivo, 'r');
    if fid == -1
      error('No se pudo abrir el archivo');
    endif
    
    % Leer encabezados
    encabezados_line = fgetl(fid);
    encabezados = strsplit(encabezados_line, ',');
    
    % Leer todas las líneas de datos
    datos = {};
    line_num = 1;
    while ~feof(fid)
      linea = fgetl(fid);
      line_num++;
      if ~isempty(linea)
        % Dividir la línea preservando campos vacíos
        campos = dividir_linea_csv(linea);
        
        if length(campos) >= 9
          datos{end+1} = campos;
        else
          printf('Advertencia: Línea %d tiene %d campos (se esperaban 9): %s\n', 
                 line_num, length(campos), linea);
          % Intentar procesar igual con los campos disponibles
          if length(campos) >= 6  % Mínimo para datos básicos
            % Rellenar campos faltantes
            campos_completos = rellenar_campos_faltantes(campos);
            datos{end+1} = campos_completos;
          endif
        endif
      endif
    endwhile
    
    % Cerrar archivo exitosamente
    fclose(fid);
    fid = -1;  % Marcar como cerrado
    
    % Crear estructura de objetos
    objetos = struct();
    
    for i = 1:length(datos)
      campos = datos{i};
      
      % Asignar valores a la estructura
      objetos(i).catalogo = campos{1};
      objetos(i).nombre = campos{2};
      objetos(i).constelacion = campos{3};
      objetos(i).tipo = campos{4};
      objetos(i).ascension_recta = str2double(campos{5});  % ra
      objetos(i).declinacion = str2double(campos{6});      % dec
      objetos(i).magnitud = str2double(campos{7});         % magnitud
      objetos(i).tamano = str2double(campos{8});           % tamano
      objetos(i).descripcion = campos{9};
      
    endfor
    
    printf('Se cargaron %d objetos desde %s\n', length(objetos), archivo);
    
  catch error
    % Cerrar archivo solo si se abrió correctamente
    if fid != -1
      fclose(fid);
    endif
    
    warning('Error leyendo CSV: %s. Usando datos de ejemplo.', error.message);
    objetos = crear_objetos_ejemplo();
  end_try_catch

endfunction