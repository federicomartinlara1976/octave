function dibujar_constelacion(nombre_constelacion, fecha, lat, lon)
% DIBUJAR_CONSTELACION Dibuja una constelación específica con detalles
%   dibujar_constelacion('Orion', now(), 40.4, -3.7)

  printf('Dibujando constelación: %s\n', nombre_constelacion);
  
  % Verificar que la constelación existe
  constelaciones = obtener_limites_constelaciones(true);
  const_idx = find(strcmp({constelaciones.nombre}, nombre_constelacion));
  
  if isempty(const_idx)
    printf('❌ Constelación "%s" no encontrada\n', nombre_constelacion);
    return;
  endif
  
  const = constelaciones(const_idx);
  
  % Configurar figura
  fig = figure('name', sprintf('Constelación: %s', nombre_constelacion), ...
         'numbertitle', 'off');
  % Configurar ejes para ocupar buen espacio
  ax = axes('Parent', fig, 'Position', [0.08, 0.12, 0.88, 0.80]);
  hold(ax, 'on');
  grid(ax, 'on');
  
  % Área de visualización centrada en la constelación
  ra_centro = (const.ra_min + const.ra_max) / 2 / 15;
  dec_centro = (const.dec_min + const.dec_max) / 2;
  
  margen_ra = (const.ra_max - const.ra_min) / 15 * 0.3;
  margen_dec = (const.dec_max - const.dec_min) * 0.3;
  
  xlim(ax, [ra_centro - margen_ra, ra_centro + margen_ra]);
  ylim(ax, [dec_centro - margen_dec, dec_centro + margen_dec]);
  
  xlabel(ax, 'Ascensión Recta (horas)');
  ylabel(ax, 'Declinación (grados)');
  title(ax, sprintf('Constelación: %s - %s', nombre_constelacion, datestr(fecha)));
  
  % Mejorar grid
  set(ax, 'GridAlpha', 0.3, 'GridLineStyle', '-');
  
  % Obtener estrellas de esta constelación
  estrellas = obtener_estrellas_brillantes();
  estrellas_const = estrellas(strcmp({estrellas.constelacion}, nombre_constelacion));
  
  if isempty(estrellas_const)
    printf('❌ No se encontraron estrellas para %s\n', nombre_constelacion);
    return;
  endif
  
  % Dibujar estrellas
  ras = [estrellas_const.ra];
  decs = [estrellas_const.dec];
  magnitudes = [estrellas_const.magnitud];
  nombres = {estrellas_const.nombre};
  
  % Tamaño proporcional al brillo
  tamanos = 10.0 - magnitudes * 2.0;
  tamanos = max(tamanos, 3);  % Mínimo tamaño
  
  % Colores según tipo espectral
  colores = cell(1, length(estrellas_const));
  for i = 1:length(estrellas_const)
    colores{i} = color_por_tipo_espectral(estrellas_const(i).tipo_espectral);
  endfor
  
  % Dibujar estrellas
  for i = 1:length(estrellas_const)
    printf("Dibujando %s\n", nombres{i});
    scatter(ras(i), decs(i), tamanos(i), colores{i}, 'filled');
    
    % Etiquetar estrellas
    %text(ras(i), decs(i) + 0.5, nombres{i}, ...
    %     'fontsize', 10, 'horizontalalignment', 'center', ...
    %     'color', colores{i});
  endfor
  
  % Dibujar figura de la constelación
  dibujar_figura_detallada(nombre_constelacion, ras, decs, magnitudes, nombres);
  
  % Información adicional
  lst = calcular_lst(fecha, lon);
  [visible, porcentaje] = constelacion_visible(const, lst, lat, 6.0);
  
  text(0.02, 0.98, sprintf('Estrellas: %d\nMagnitud más brillante: %.2f\nVisibilidad: %.0f%%', ...
       length(estrellas_const), min(magnitudes), porcentaje*100), ...
       'units', 'normalized', 'verticalalignment', 'top', ...
       'backgroundcolor', 'white', 'edgecolor', 'black');
       
  % APLICAR RELACIÓN DE ASPECTO ANCHA
  axis(ax, 'normal');  % Quitar 'axis equal' que comprime
  set(ax, 'PlotBoxAspectRatio', [2.4, 1, 1]);  % 2.4:1 relación ancha
  
  hold(ax, 'off');
  
  printf('✅ Constelación %s dibujada (%d estrellas)\n', nombre_constelacion, length(estrellas_const));
endfunction