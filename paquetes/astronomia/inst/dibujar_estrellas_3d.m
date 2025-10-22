function dibujar_estrellas_3d(fecha, lat, lon)
% DIBUJAR_ESTRELLAS_3D Dibuja estrellas en coordenadas 3D

  estrellas = obtener_estrellas_brillantes();
  lst = calcular_lst(fecha, lon);
  lat_rad = deg2rad(lat);
  
  % Filtrar estrellas brillantes
  estrellas = estrellas([estrellas.magnitud] <= 2.5);
  
  for i = 1:length(estrellas)
    estrella = estrellas(i);
    
    % Convertir coordenadas ecuatoriales a horizontales
    [azimuth, altura] = coords_ecuatoriales_a_horizontales(...
      estrella.ra, estrella.dec, lst, lat_rad);
    
    % Convertir a coordenadas cartesianas 3D
    [x, y, z] = esfericas_a_cartesianas(azimuth, altura);
    
    % Tamaño según magnitud
    tamano = 10.0 - estrella.magnitud * 2.0;
    tamano = max(tamano, 3);
    
    % Color según tipo espectral
    color = color_por_tipo_espectral(estrella.tipo_espectral);
    
    % Dibujar estrella
    plot3(x, y, z, 'o', 'markersize', tamano, ...
          'markerfacecolor', color, 'markeredgecolor', 'black');
    
    % Etiquetar estrellas muy brillantes
    if estrella.magnitud < 1.0
      text(x, y, z + 0.05, estrella.nombre, ...
           'fontsize', 8, 'horizontalalignment', 'center');
    endif
  endfor
endfunction