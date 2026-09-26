function [exito, datos] = descargar_datos_publicos()
% DESCARGAR_DATOS_PUBLICOS Descarga de repositorios astronómicos

  exito = false;
  datos = [];

  % URLs de repositorios públicos (ejemplos)
  repositorios = {
    'https://raw.githubusercontent.com/astropy/astropy-data/master/.../constellations.csv',
    'https://raw.githubusercontent.com/Stellarium/stellarium/master/.../constellations.dat',
    'https://heasarc.gsfc.nasa.gov/db-perl/W3Browse/w3table.pl?...'
  };

  for i = 1:length(repositorios)
    try
      printf('   Intentando repositorio %d/%d...\n', i, length(repositorios));
      url = repositorios{i};

      % Descargar archivo temporal
      archivo_temp = tempname();
      urlwrite(url, archivo_temp);

      % Procesar según formato
      if contains(url, '.csv')
        datos = procesar_csv_descargado(archivo_temp);
      elseif contains(url, '.dat')
        datos = procesar_dat_descargado(archivo_temp);
      else
        datos = procesar_generico_descargado(archivo_temp);
      endif

      % Limpiar archivo temporal
      delete(archivo_temp);

      if ~isempty(datos)
        exito = true;
        printf('   ✓ Datos descargados correctamente\n');
        break;
      endif

    catch err
      printf('   ✗ Error con repositorio %d: %s\n', i, err.message);
    end_try_catch
  endfor
endfunction
