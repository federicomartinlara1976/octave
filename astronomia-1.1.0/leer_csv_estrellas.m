function estrellas = leer_csv_estrellas(archivo)
% LEER_CSV_ESTRELLAS Lee archivo CSV de estrellas
  
  estrellas = struct();
  
  try
    fid = fopen(archivo, 'r');
    if fid == -1
      error('No se pudo abrir el archivo de estrellas');
    endif
    
    % Leer cabecera
    cabecera = fgetl(fid);
    contador = 1;
    
    while ~feof(fid)
      linea = fgetl(fid);
      if ~isempty(linea)
        campos = strsplit(linea, ',');
        
        if length(campos) >= 6
          estrellas(contador).nombre = campos{1};
          estrellas(contador).constelacion = campos{2};
          estrellas(contador).ra = str2double(campos{3});
          estrellas(contador).dec = str2double(campos{4});
          estrellas(contador).magnitud = str2double(campos{5});
          estrellas(contador).tipo_espectral = campos{6};
          
          if length(campos) >= 7
            estrellas(contador).nombre_alternativo = campos{7};
          else
            estrellas(contador).nombre_alternativo = '';
          endif
          
          contador = contador + 1;
        endif
      endif
    endwhile
    
    fclose(fid);
    
  catch err
    printf('   ✗ Error leyendo estrellas: %s\n', err.message);
    estrellas = obtener_estrellas_basicas();
  end_try_catch
endfunction