function dibujar_referencias()
% DIBUJAR_REFERENCIAS Dibuja líneas de referencia celestes

  % Eclíptica
  ecliptica_ra = 0:0.1:24;
  ecliptica_dec = 23.44 * sin(deg2rad(ecliptica_ra * 15));
  plot(ecliptica_ra, ecliptica_dec, 'g-', 'linewidth', 1, ...
       'displayname', 'Eclíptica');
  
  % Ecuador celeste
  plot([0 24], [0 0], 'k-', 'linewidth', 1, 'displayname', 'Ecuador');
  
  % Líneas de declinación cada 30°
  for dec = [-60, -30, 30, 60]
    plot([0 24], [dec dec], 'k:', 'linewidth', 0.5, ...
         'handlevisibility', 'off');
  endfor
  
  % Líneas de ascensión recta cada 3 horas
  for ra = [3, 6, 9, 12, 15, 18, 21]
    plot([ra ra], [-90 90], 'k:', 'linewidth', 0.5, ...
         'handlevisibility', 'off');
  endfor
endfunction