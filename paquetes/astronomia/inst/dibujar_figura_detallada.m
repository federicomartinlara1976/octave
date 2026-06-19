function dibujar_figura_detallada(nombre, ras, decs, magnitudes, nombres)
% DIBUJAR_FIGURA_DETALLADA Dibuja figura detallada de constelación

  % Conexiones específicas para constelaciones conocidas
  switch nombre
    case 'Orion'
      % Identificar estrellas clave por nombre
      %idx_betelgeuse = find(strcmp(nombres, 'Betelgeuse'));
      %idx_rigel = find(strcmp(nombres, 'Rigel'));
      %idx_bellatrix = find(strcmp(nombres, 'Bellatrix'));
      %idx_alnitak = find(strcmp(nombres, 'Alnitak'));
      %idx_alnilam = find(strcmp(nombres, 'Alnilam'));
      %idx_mintaka = find(strcmp(nombres, 'Mintaka'));
      %idx_saiph = find(strcmp(nombres, 'Saiph'));
      
      %conexiones = [
      %  idx_betelgeuse 2, idx_bellatrix 3;  % Hombros
      %  idx_betelgeuse 2, idx_alnitak 4;    % Brazo derecho
      %  idx_bellatrix 3, idx_mintaka 6;     % Brazo izquierdo
      %  idx_alnitak 6, idx_alnilam 5;       % Cinturón
      %  idx_alnilam 5, idx_mintaka 4;       % Cinturón
      %  idx_alnitak 6, idx_saiph 7;         % Pierna derecha
      %  idx_mintaka 4, idx_rigel 1          % Pierna izquierda
      %];
      % Cazador: hombros, cinturón, piernas
      conexiones = [2,4;3,6;6,1;4,7;1,7];
      
    case 'Ursa Major'
      % Ordenar por posición para formar el carro
      %[~, idx_orden] = sort(ras);
      %conexiones = [
      %  idx_orden(1), idx_orden(2);
      %  idx_orden(2), idx_orden(3);
      %  idx_orden(3), idx_orden(4);
      %  idx_orden(4), idx_orden(1);
      %  idx_orden(4), idx_orden(5);
      %  idx_orden(5), idx_orden(6);
      %  idx_orden(6), idx_orden(7);
      %];
      conexiones = [1,2; 2,3; 3,4; 4,1; 4,5; 5,6; 6,7];
      
    otherwise
      % Conexión automática para estrellas cercanas
      conexiones = [];
      umbral = 10; % grados
      
      for i = 1:length(ras)
        for j = i+1:length(ras)
          dist = sqrt((ras(i)-ras(j))^2 + (decs(i)-decs(j))^2);
          if dist < umbral
            conexiones = [conexiones; i, j];
          endif
        endfor
      endfor
  endswitch
  
  % 1. DIBUJAR ETIQUETAS NUMERADAS DE ESTRELLAS (PRIMERO)
  for i = 1:length(ras)
    text(ras(i), decs(i) - 0.5, sprintf('%s', nombres{i}), ...  % Offset hacia abajo
         'HorizontalAlignment', 'center', ...
         'VerticalAlignment', 'top', ...
         'FontSize', 11, ...
         'Color', 'red', ...
         'BackgroundColor', 'white', ...
         'EdgeColor', 'red', ...
         'Margin', 1);
  endfor
  
  % Dibujar líneas
  for i = 1:size(conexiones, 1)
    if conexiones(i,1) <= length(ras) && conexiones(i,2) <= length(ras)
      plot([ras(conexiones(i,1)), ras(conexiones(i,2))], ...
           [decs(conexiones(i,1)), decs(conexiones(i,2))], ...
           'r-', 'linewidth', 0.5);
    endif
  endfor
endfunction