function [es_visible, porcentaje] = constelacion_visible(constelacion, lst, lat, mag_limite)
% CONSTELACION_VISIBLE Determina si una constelación es visible

  % Ángulo horario del centro de la constelación
  ra_centro = (constelacion.ra_min + constelacion.ra_max) / 2 / 15;  % horas
  dec_centro = (constelacion.dec_min + constelacion.dec_max) / 2;    % grados

  % Ángulo horario actual
  H = lst - ra_centro;
  if H > 12
    H = H - 24;
  elseif H < -12
    H = H + 24;
  endif

  % Altura sobre el horizonte
  H_rad = deg2rad(H * 15);
  dec_rad = deg2rad(dec_centro);
  lat_rad = deg2rad(lat);

  altura = asin(sin(lat_rad) * sin(dec_rad) + cos(lat_rad) * cos(dec_rad) * cos(H_rad));
  altura_grados = rad2deg(altura);

  % Considerar visible si está a más de 15° sobre el horizonte
  es_visible = altura_grados > 15;

  % Porcentaje de visibilidad (simplificado)
  if es_visible
    porcentaje = min(altura_grados / 90, 1);
  else
    porcentaje = 0;
  endif
endfunction
