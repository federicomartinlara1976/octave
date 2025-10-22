function dibujar_figura_detallada(nombre, ras, decs, magnitudes, nombres)
% DIBUJAR_FIGURA_DETALLADA Dibuja figura detallada de constelación

  % Conexiones específicas para constelaciones conocidas
  switch nombre
    case 'Orion'
      % Identificar estrellas clave por nombre
      idx_betelgeuse = find(strcmp(nombres, 'Betelgeuse'));
      idx_rigel = find(strcmp(nombres, 'Rigel'));
      idx_bellatrix = find(strcmp(nombres, 'Bellatrix'));
      idx_alnitak = find(strcmp(nombres, 'Alnitak'));
      idx_alnilam = find(strcmp(nombres, 'Alnilam'));
      idx_mintaka = find(strcmp(nombres, 'Mintaka'));
      idx_saiph = find(strcmp(nombres, 'Saiph'));
      
      conexiones = [
        idx_betelgeuse, idx_bellatrix;  % Hombros
        idx_betelgeuse, idx_alnitak;    % Brazo derecho
        idx_bellatrix, idx_mintaka;     % Brazo izquierdo
        idx_alnitak, idx_alnilam;       % Cinturón
        idx_alnilam, idx_mintaka;       % Cinturón
        idx_alnitak, idx_rigel;         % Pierna derecha
        idx_mintaka, idx_saiph          % Pierna izquierda
      ];
      
    case 'Ursa Major'
      % Ordenar por posición para formar el carro
      [~, idx_orden] = sort(ras);
      conexiones = [
        idx_orden(1), idx_orden(2);
        idx_orden(2), idx_orden(3);
        idx_orden(3), idx_orden(4);
        idx_orden(4), idx_orden(5);
        idx_orden(5), idx_orden(6);
        idx_orden(6), idx_orden(7);
        idx_orden(7), idx_orden(1)
      ];
      
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
  
  % Dibujar líneas
  for i = 1:size(conexiones, 1)
    if conexiones(i,1) <= length(ras) && conexiones(i,2) <= length(ras)
      plot([ras(conexiones(i,1)), ras(conexiones(i,2))], ...
           [decs(conexiones(i,1)), decs(conexiones(i,2))], ...
           'r-', 'linewidth', 2);
    endif
  endfor
endfunction