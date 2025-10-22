function [azimuth, altura] = coords_ecuatoriales_a_horizontales(ra, dec, lst, lat_rad)
% COORDS_ECUATORIALES_A_HORIZONTALES Conversión de coordenadas

  ra_rad = deg2rad(ra * 15);
  dec_rad = deg2rad(dec);
  
  # Ángulo horario
  H = deg2rad((lst - ra) * 15);
  
  # Conversión a coordenadas horizontales
  altura_rad = asin(sin(lat_rad) * sin(dec_rad) + cos(lat_rad) * cos(dec_rad) * cos(H));
  azimuth_rad = atan2(-cos(dec_rad) * sin(H), ...
                     sin(dec_rad) * cos(lat_rad) - cos(dec_rad) * sin(lat_rad) * cos(H));
  
  azimuth = rad2deg(azimuth_rad);
  altura = rad2deg(altura_rad);
  
  # Ajustar azimuth a rango 0-360
  if azimuth < 0
    azimuth = azimuth + 360;
  endif
endfunction