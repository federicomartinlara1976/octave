function dibujar_horizonte_visible(lst, lat)
% DIBUJAR_HORIZONTE_VISIBLE - Marca la región visible actualmente

  ax = gca;
  
  % Calcular límites de declinación visible
  dec_min = -90 + abs(lat);
  dec_max = 90 - abs(lat);
  
  if lat > 0  % Hemisferio norte
    dec_circumpolar = 90 - lat;
    dec_invisible = -90 + lat;
    
    % Región circumpolar (siempre visible)
    fill(ax, [0, 24, 24, 0], [dec_circumpolar, dec_circumpolar, 90, 90], ...
         [0.9, 0.9, 1], 'FaceAlpha', 0.3, 'EdgeColor', 'none', ...
         'DisplayName', 'Circumpolar');
    
    % Región nunca visible
    fill(ax, [0, 24, 24, 0], [-90, -90, dec_invisible, dec_invisible], ...
         [1, 0.9, 0.9], 'FaceAlpha', 0.3, 'EdgeColor', 'none', ...
         'DisplayName', 'No visible');
         
  else  % Hemisferio sur
    dec_circumpolar = -90 - lat;
    dec_invisible = 90 + lat;
    
    % Región circumpolar (siempre visible)
    fill(ax, [0, 24, 24, 0], [-90, -90, dec_circumpolar, dec_circumpolar], ...
         [0.9, 0.9, 1], 'FaceAlpha', 0.3, 'EdgeColor', 'none', ...
         'DisplayName', 'Circumpolar');
    
    % Región nunca visible
    fill(ax, [0, 24, 24, 0], [dec_invisible, dec_invisible, 90, 90], ...
         [1, 0.9, 0.9], 'FaceAlpha', 0.3, 'EdgeColor', 'none', ...
         'DisplayName', 'No visible');
  endif
endfunction