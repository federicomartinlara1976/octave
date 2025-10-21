function datos = procesar_archivo_stellarium(archivo)
% PROCESAR_ARCHIVO_STELLARIUM Procesa formato Stellarium .dat

  datos = struct();
  fid = fopen(archivo, 'r');
  contador = 1;

  while ~feof(fid)
    linea = fgetl(fid);

    if startsWith(linea, 'constellation')
      % Formato: "constellation "Ori" "Orion" ..."
      partes = strsplit(linea, '"');

      if length(partes) >= 3
        datos(contador).abreviatura = partes{2};
        datos(contador).nombre = partes{4};
        contador = contador + 1;
      endif
    endif
  endwhile

  fclose(fid);
endfunction
