function mapa_estelar_simple(fecha, lat, lon, magnitud_limite, constelaciones_destacadas)
% MAPA_ESTELAR_SIMPLE Genera mapa estelar en coordenadas
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

  % Configurar figura
  figure('name', 'Mapa Estelar', 'numbertitle', 'off');
  hold on;
  grid on;
  axis equal;
  
  % Configurar ejes
  xlim([0 24]);
  ylim([-90 90]);
  xlabel('Ascensión Recta (horas)');
  ylabel('Declinación (grados)');
  title(sprintf('Mapa Estelar - %s', datestr(fecha)));
  
  % Calcular tiempo sidéreo local
  lst = calcular_lst(fecha, lon);
  
  % Dibujar constelaciones visibles
  dibujar_constelaciones_visibles(lst, lat, magnitud_limite, constelaciones_destacadas);
  
  % Dibujar líneas de referencia
  dibujar_referencias();
  
  % Marcar posición actual del meridiano
  plot([lst lst], [-90 90], 'r--', 'linewidth', 1, 'displayname', 'Meridiano Local');
  
  legend('show', 'location', 'northeastoutside');
  printf('✅ Mapa estelar generado\n');
endfunction