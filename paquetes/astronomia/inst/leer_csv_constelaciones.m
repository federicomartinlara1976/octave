function datos = leer_csv_constelaciones(archivo)
% LEER_CSV_CONSTELACIONES Lee archivo CSV de constelaciones
  
  datos = struct();
  
  try
    fid = fopen(archivo, 'r');
    if fid == -1
      error('No se pudo abrir el archivo');
    endif
    
    % Leer cabecera
    cabecera = fgetl(fid);
    contador = 1;
    
    while ~feof(fid)
      linea = fgetl(fid);
      if ~isempty(linea)
        campos = strsplit(linea, ',');
        
        if length(campos) >= 8
          datos(contador).nombre = campos{1};
          datos(contador).abreviatura = campos{2};
          datos(contador).ra_min = str2double(campos{3});
          datos(contador).ra_max = str2double(campos{4});
          datos(contador).dec_min = str2double(campos{5});
          datos(contador).dec_max = str2double(campos{6});
          datos(contador).area = str2double(campos{7});
          datos(contador).estrellas_principales = str2double(campos{8});
          
          if length(campos) >= 9
            datos(contador).mitologia = campos{9};
          else
            datos(contador).mitologia = '';
          endif
          
          contador = contador + 1;
        endif
      endif
    endwhile
    
    fclose(fid);
    
  catch err
    printf('   ✗ Error leyendo CSV: %s\n', err.message);
    datos = obtener_constelaciones_basicas();
  end_try_catch
endfunction