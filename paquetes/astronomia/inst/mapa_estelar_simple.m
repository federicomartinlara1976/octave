function mapa_estelar_simple(fecha, lat, lon, magnitud_limite, constelaciones_destacadas)
% MAPA_ESTELAR_SIMPLE Genera mapa estelar en coordenadas - VERSIÓN ANCHA COMPLETA
%   mapa_estelar_simple(fecha, lat, lon, magnitud_limite, constelaciones_destacadas)

  if nargin < 4
    magnitud_limite = 3.5;
  endif
  if nargin < 5
    constelaciones_destacadas = {};
  endif

  printf('Generando mapa estelar...\n');
  printf('Fecha: %s\n', datestr(fecha));
  printf('Ubicación: %.1f°N, %.1f°E\n', lat, lon);
  printf('Magnitud límite: %.1f\n\n', magnitud_limite);

  % Configurar figura MUY ANCHA
  fig = figure('Name', 'Mapa Estelar Simple', 'NumberTitle', 'off', ...
               'Position', [50, 100, 1600, 600]);  % Más ancha que alta

  % Configurar ejes para ocupar casi toda la figura
  ax = axes('Parent', fig, 'Position', [0.05, 0.12, 0.90, 0.80]);  % [left, bottom, width, height]
  
  hold(ax, 'on');
  grid(ax, 'on');
  
  % Configurar límites - FORZAR relación de aspecto ancha
  xlim(ax, [0, 24]);
  ylim(ax, [-90, 90]);
  set(ax, 'XDir', 'reverse');  % Convención astronómica
  
  % Mejorar los ticks
  set(ax, 'XTick', 0:1:24, 'YTick', -90:15:90);  % Más ticks para mejor referencia
  set(ax, 'GridAlpha', 0.2, 'GridLineStyle', '-');
  
  % Etiquetas de ejes
  xlabel(ax, 'Ascensión Recta (horas)', 'FontSize', 12, 'FontWeight', 'bold');
  ylabel(ax, 'Declinación (grados)', 'FontSize', 12, 'FontWeight', 'bold');
  
  % Título
  title(ax, sprintf('Mapa Estelar - %s | Lat: %.1f°N, Lon: %.1f°E', datestr(fecha), lat, lon), ...
        'FontSize', 14, 'FontWeight', 'bold');
  
  % Calcular tiempo sidéreo local
  lst = calcular_lst(fecha, lon);
  
  % Dibujar constelaciones visibles
  dibujar_constelaciones_visibles(lst, lat, magnitud_limite, constelaciones_destacadas);
  
  % Dibujar líneas de referencia
  dibujar_referencias_muy_anchas();
  
  % Meridiano local muy visible
  plot(ax, [lst lst], [-90 90], 'r-', 'linewidth', 3, ...
       'displayname', sprintf('Meridiano (LST: %.1fh)', lst));
  
  % Añadir horizonte visible
  dibujar_horizonte_visible(lst, lat);
  
  % Información adicional en texto
  text(ax, 0.5, -80, sprintf('LST: %.2f h | Magnitud límite: %.1f', lst, magnitud_limite), ...
       'HorizontalAlignment', 'center', 'FontSize', 10, 'BackgroundColor', 'white', ...
       'EdgeColor', 'black', 'FontWeight', 'bold');
  
  % Solo mostrar leyenda si hay elementos
  if ~isempty(get(ax, 'Children'))
    legend(ax, 'show', 'location', 'northeastoutside', 'FontSize', 9, 'Box', 'off');
  endif
  
  % FORZAR relación de aspecto ancha - ESTA ES LA CLAVE
  axis(ax, 'normal');  % Quitar 'axis equal' que comprime
  set(ax, 'PlotBoxAspectRatio', [2.4, 1, 1]);  % 2.4:1 relación ancha
  
  hold(ax, 'off');
  
  printf('✅ Mapa estelar generado (versión ultra ancha)\n');
endfunction