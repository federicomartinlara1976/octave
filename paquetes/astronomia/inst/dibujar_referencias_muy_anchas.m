function dibujar_referencias_muy_anchas()
% DIBUJAR_REFERENCIAS_MUY_ANCHAS - Optimizado para visualización ancha

  ax = gca;
  
  % Ecuador celeste prominente
  plot(ax, [0, 24], [0, 0], 'k-', 'LineWidth', 2.5, ...
       'DisplayName', 'Ecuador Celeste');
  
  % Trópicos y círculos polares
  plot(ax, [0, 24], [23.5, 23.5], '--', 'Color', [0.8, 0.4, 0], ...
       'LineWidth', 1, 'DisplayName', 'Trópico Cáncer');
  plot(ax, [0, 24], [-23.5, -23.5], '--', 'Color', [0, 0.4, 0.8], ...
       'LineWidth', 1, 'DisplayName', 'Trópico Capricornio');
  plot(ax, [0, 24], [66.5, 66.5], '--', 'Color', [0.4, 0.4, 0.8], ...
       'LineWidth', 1, 'DisplayName', 'Círculo Polar Ártico');
  plot(ax, [0, 24], [-66.5, -66.5], '--', 'Color', [0.4, 0.8, 0.4], ...
       'LineWidth', 1, 'DisplayName', 'Círculo Polar Antártico');
  
  % Líneas de AR cada 1 hora (más densas para visualización ancha)
  for ar = 1:23
    plot(ax, [ar, ar], [-90, 90], ':', 'Color', [0.9, 0.9, 0.9], ...
         'LineWidth', 0.3, 'HandleVisibility', 'off');
  endfor
endfunction