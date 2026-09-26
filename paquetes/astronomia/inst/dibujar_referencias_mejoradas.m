function dibujar_referencias_mejoradas()
% DIBUJAR_REFERENCIAS_MEJORADAS - Líneas de referencia más visibles

  ax = gca;
  
  % Línea del ecuador celeste
  plot(ax, [0, 24], [0, 0], 'k-', 'LineWidth', 2, ...
       'DisplayName', 'Ecuador Celeste');
  
  % Líneas de declinación cada 30°
  for dec = [-60, -30, 30, 60]
    plot(ax, [0, 24], [dec, dec], '--', 'Color', [0.7, 0.7, 0.7], ...
         'LineWidth', 0.5, 'HandleVisibility', 'off');
  endfor
  
  % Líneas de ascensión recta cada 2 horas
  for ar = 2:2:22
    plot(ax, [ar, ar], [-90, 90], '--', 'Color', [0.7, 0.7, 0.7], ...
         'LineWidth', 0.5, 'HandleVisibility', 'off');
  endfor
  
  % Puntos cardinales
  text(ax, 6, 85, 'Norte', 'HorizontalAlignment', 'center', ...
       'FontWeight', 'bold', 'BackgroundColor', 'white');
  text(ax, 6, -85, 'Sur', 'HorizontalAlignment', 'center', ...
       'FontWeight', 'bold', 'BackgroundColor', 'white');
endfunction