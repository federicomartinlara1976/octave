function dibujar_constelaciones_3d()
% DIBUJAR_CONSTELACIONES_3D Dibuja líneas de constelaciones en 3D

  % Por simplicidad, dibujamos solo algunas constelaciones principales
  constelaciones_principales = {'Orion', 'Ursa Major', 'Cassiopeia', 'Cygnus'};
  
  for i = 1:length(constelaciones_principales)
    nombre = constelaciones_principales{i};
    
    % Obtener estrellas de la constelación
    estrellas = obtener_estrellas_brillantes();
    estrellas_const = estrellas(strcmp({estrellas.constelacion}, nombre));
    estrellas_const = estrellas_const([estrellas_const.magnitud] <= 3.0);
    
    if length(estrellas_const) >= 2
      % Convertir a coordenadas 3D (simplificado - todas a radio 1)
      ras = [estrellas_const.ra] * 15;  # A grados
      decs = [estrellas_const.dec];
      
      % Proyección simple para visualización
      thetas = deg2rad(90 - decs);  # Co-latitud
      phis = deg2rad(ras);
      
      xs = sin(thetas) .* cos(phis);
      ys = sin(thetas) .* sin(phis); 
      zs = cos(thetas);
      
      % Dibujar líneas de conexión
      for j = 1:length(estrellas_const)-1
        for k = j+1:length(estrellas_const)
          % Conectar estrellas cercanas
          dist = sqrt((ras(j)-ras(k))^2 + (decs(j)-decs(k))^2);
          if dist < 20  # Umbral de 20 grados
            plot3([xs(j), xs(k)], [ys(j), ys(k)], [zs(j), zs(k)], ...
                 'b-', 'linewidth', 1);
          endif
        endfor
      endfor
      
      # Etiquetar constelación
      text(mean(xs), mean(ys), mean(zs), nombre, ...
           'fontsize', 10, 'fontweight', 'bold', 'color', 'blue');
    endif
  endfor
endfunction