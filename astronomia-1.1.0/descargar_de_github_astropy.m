function datos = descargar_de_github_astropy()
% DESCARGAR_DE_GITHUB_ASTROPY Datos del repositorio de Astropy

  try
    % URL ejemplo (necesitarías la real)
    url = 'https://raw.githubusercontent.com/astropy/astropy-data/master/coordinates/constellations.csv';
    archivo_temp = tempname();

    % Usar curl o wget via sistema
    system(sprintf('curl -s -o "%s" "%s"', archivo_temp, url));

    if exist(archivo_temp, 'file')
      datos = leer_csv_astropy(archivo_temp);
      delete(archivo_temp);
    else
      datos = [];
    endif

  catch
    datos = [];
  end_try_catch
endfunction
