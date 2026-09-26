function datos = descargar_de_stellarium()
% DESCARGAR_DE_STELLARIUM Datos del proyecto Stellarium

  try
    % Stellarium tiene formatos .dat específicos
    url = 'https://raw.githubusercontent.com/Stellarium/stellarium/master/skycultures/western/constellations.dat';
    archivo_temp = tempname();

    system(sprintf('wget -q -O "%s" "%s"', archivo_temp, url));

    if exist(archivo_temp, 'file')
      datos = procesar_archivo_stellarium(archivo_temp);
      delete(archivo_temp);
    else
      datos = [];
    endif

  catch
    datos = [];
  end_try_catch
endfunction
