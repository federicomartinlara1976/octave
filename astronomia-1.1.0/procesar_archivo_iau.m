function datos = procesar_archivo_iau(archivo)
% PROCESAR_ARCHIVO_IAU Procesa formato oficial IAU

  datos = struct();
  fid = fopen(archivo, 'r');
  contador = 1;

  while ~feof(fid)
    linea = fgetl(fid);

    if ~isempty(linea) && ~startsWith(linea, '#')
      % Formato IAU: "And Andromeda 00 08 23.65 +29 05 26.0 02 39 32.90 +37 35 31.0 ..."
      partes = strsplit(linea);

      if length(partes) >= 13
        datos(contador).abreviatura = partes{1};
        datos(contador).nombre = partes{2};

        % Convertir coordenadas de HMS/DMS a decimal
        % (implementar conversión)

        contador = contador + 1;
      endif
    endif
  endwhile

  fclose(fid);
endfunction
