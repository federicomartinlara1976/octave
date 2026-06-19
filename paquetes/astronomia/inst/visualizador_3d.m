function visualizador_3d(fecha, lat, lon)
% VISUALIZADOR_3D Visualización esférica básica del cielo
%   visualizador_3d(now(), 40.4, -3.7)

  printf('Iniciando visualizador 3D...\n');
  
  figure('name', 'Visualizador 3D del Cielo', 'numbertitle', 'off');
  
  % Crear esfera para representar la bóveda celeste
  [x, y, z] = sphere(50);
  r = 1.0;  # Radio unitario
  
  % Dibujar esfera transparente
  surf(r*x, r*y, r*z, 'facealpha', 0.1, 'edgealpha', 0.2);
  hold on;
  axis equal;
  grid on;
  
  xlabel('X (Este)');
  ylabel('Y (Norte)'); 
  zlabel('Z (Cénit)');
  title(sprintf('Visualización 3D - %s', datestr(fecha)));
  
  % Dibujar estrellas brillantes
  dibujar_estrellas_3d(fecha, lat, lon);
  
  % Dibujar constelaciones
  dibujar_constelaciones_3d();
  
  % Dibujar referencia del observador
  plot3(0, 0, 0, 'ro', 'markersize', 10, 'markerfacecolor', 'red');
  text(0, 0, -0.1, 'OBSERVADOR', 'horizontalalignment', 'center', ...
       'fontweight', 'bold');
  
  printf('✅ Visualizador 3D listo\n');
endfunction