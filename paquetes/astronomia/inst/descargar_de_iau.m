function datos = descargar_de_iau()
% DESCARGAR_DE_IAU Datos oficiales de la Unión Astronómica Internacional

  try
    % La IAU tiene datos oficiales de límites
    url = 'https://www.iau.org/static/public/constellations/txt/constellations.txt';
    archivo_temp = tempname();

    urlwrite(url, archivo_temp);

    if exist(archivo_temp, 'file')
      datos = procesar_archivo_iau(archivo_temp);
      delete(archivo_temp);
    else
      datos = [];
    endif

  catch
    datos = [];
  end_try_catch
endfunction
