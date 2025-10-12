function [constelaciones, porcentajes] = constelaciones_visibles(fecha, lat, lon, magnitud_limite)
% CONSTELACIONES_VISIBLES Lista constelaciones visibles
%   [constelaciones, porcentajes] = constelaciones_visibles(fecha, lat, lon, magnitud_limite)
%
%   Input:
%     fecha - Fecha en datenum
%     lat, lon - Ubicación del observador
%     magnitud_limite - Magnitud límite (ej: 6.0 para cielo oscuro)
%
%   Output:
%     constelaciones - Nombres de constelaciones visibles
%     porcentajes   - Porcentaje de visibilidad

  if nargin < 4
    magnitud_limite = 4.5;  % Cielo urbano típico
  endif

  % Obtener tiempo sidéreo local
  lst = calcular_lst(fecha, lon);

  % Cargar datos de constelaciones
  datos = obtener_limites_constelaciones();

  constelaciones = {};
  porcentajes = [];

  for i = 1:length(datos)
    % Calcular si la constelación es visible
    [es_visible, porcentaje] = constelacion_visible(datos(i), lst, lat, magnitud_limite);

    if es_visible
      constelaciones{end+1} = datos(i).nombre;
      porcentajes(end+1) = porcentaje;
    endif
  endfor

  printf('Constelaciones visibles (%s):\n', datestr(fecha));
  printf('Ubicación: %.2f°N, %.2f°E\n', lat, lon);
  printf('Magnitud límite: %.1f\n\n', magnitud_limite);

  for i = 1:length(constelaciones)
    estrellas = contar_estrellas_brillantes(constelaciones{i}, magnitud_limite);
    printf('• %-15s (%3.0f%%) - %2d estrellas > %.1f mag\n', ...
           constelaciones{i}, porcentajes(i)*100, estrellas, magnitud_limite);
  endfor

  printf('\nTotal: %d constelaciones visibles\n', length(constelaciones));
endfunction
