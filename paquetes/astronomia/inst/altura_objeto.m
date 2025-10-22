function altura = altura_objeto(ra, dec, lst, lat)
% ALTURA_OBJETO Calcula altura de un objeto sobre el horizonte

  ra_rad = deg2rad(ra * 15);
  dec_rad = deg2rad(dec);
  lat_rad = deg2rad(lat);
  
  % Ángulo horario
  H = deg2rad((lst - ra) * 15);
  
  altura_rad = asin(sin(lat_rad) * sin(dec_rad) + cos(lat_rad) * cos(dec_rad) * cos(H));
  altura = rad2deg(altura_rad);
endfunction