function [x, y, z] = esfericas_a_cartesianas(azimuth, altura)
% ESFERICAS_A_CARTESIANAS Conversión a coordenadas 3D

  az_rad = deg2rad(azimuth);
  alt_rad = deg2rad(altura);
  
  r = 1.0;  # Radio unitario
  
  x = r * cos(alt_rad) * sin(az_rad);
  y = r * cos(alt_rad) * cos(az_rad);
  z = r * sin(alt_rad);
endfunction