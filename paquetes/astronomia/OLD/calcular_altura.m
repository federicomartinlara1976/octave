function altura = calcular_altura(ar, dec, lst, lat)
% CALCULAR_ALTURA Calcula la altura de un objeto celeste
% ar: ascensión recta en horas
% dec: declinación en grados
% lst: tiempo sidéreo local en horas
% lat: latitud del observador en grados

  % Convertir a radianes
  ar_rad = deg2rad(ar * 15);
  dec_rad = deg2rad(dec);
  lat_rad = deg2rad(lat);
  lst_rad = deg2rad(lst * 15);
  
  % Ángulo horario
  h = lst_rad - ar_rad;
  
  % Fórmula de altura
  altura_rad = asin(sin(dec_rad) * sin(lat_rad) + ...
                   cos(dec_rad) * cos(lat_rad) * cos(h));
  
  altura = rad2deg(altura_rad);
endfunction