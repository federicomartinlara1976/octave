function mapa_estelar_simple(fecha, lat, lon, magnitud_limite, constelaciones_destacadas)
% MAPA_ESTELAR_SIMPLE Genera mapa estelar en coordenadas - VERSIÓN MEJORADA
%   mapa_estelar_simple(fecha, lat, lon, magnitud_limite, constelaciones_destacadas)
%
%   Ejemplo:
%     mapa_estelar_simple(now(), 40.4, -3.7, 3.0, {'Orion', 'Ursa Major'})

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

  % Configurar figura MÁS ANCHA
  fig = figure('Name', 'Mapa Estelar Simple', 'NumberTitle', 'off', ...
               'Position', [100, 100, 1400, 700]);
  
  % Configurar ejes con mejor relación de aspecto
  ax = axes('Parent', fig);
  hold(ax, 'on');
  grid(ax, 'on');
  
  % Configurar límites y aspecto de ejes
  xlim(ax, [0, 24]);
  ylim(ax, [-90, 90]);
  set(ax, 'XDir', 'reverse');  % Convención astronómica (Este a la izquierda)
  
  % Mejorar los ticks
  set(ax, 'XTick', 0:2:24, 'YTick', -90:30:90);
  set(ax, 'GridAlpha', 0.3, 'GridLineStyle', '-');
  
  % Etiquetas de ejes más grandes
  xlabel(ax, 'Ascensión Recta (horas)', 'FontSize', 12, 'FontWeight', 'bold');
  ylabel(ax, 'Declinación (grados)', 'FontSize', 12, 'FontWeight', 'bold');
  
  % Título mejorado
  title(ax, sprintf('Mapa Estelar - %s | Lat: %.1f°N', datestr(fecha), lat), ...
        'FontSize', 14, 'FontWeight', 'bold');
  
  % Calcular tiempo sidéreo local
  lst = calcular_lst(fecha, lon);
  
  % Dibujar constelaciones visibles
  dibujar_constelaciones_visibles(lst, lat, magnitud_limite, constelaciones_destacadas);
  
  % Dibujar líneas de referencia MEJORADAS
  dibujar_referencias_mejoradas();
  
  % Marcar posición actual del meridiano (más visible)
  plot(ax, [lst lst], [-90 90], 'r-', 'linewidth', 2.5, ...
       'displayname', 'Meridiano Local');
  
  % Añadir línea del horizonte visible
  dibujar_horizonte_visible(lst, lat);
  
  % Añadir información de la ubicación
  text(ax, 0.02, 0.98, sprintf('LST: %.2fh | Lon: %.1f°', lst, lon), ...
       'Units', 'normalized', 'FontSize', 10, 'BackgroundColor', 'white', ...
       'EdgeColor', 'black', 'VerticalAlignment', 'top');
  
  % Mejorar la leyenda
  legend(ax, 'show', 'location', 'northeastoutside', 'FontSize', 9);
  
  % Ajustar relación de aspecto para mejor visualización
  set(ax, 'DataAspectRatio', [1, 1.5, 1]);
  
  hold(ax, 'off');
  
  printf('✅ Mapa estelar generado (figura mejorada)\n');
endfunction