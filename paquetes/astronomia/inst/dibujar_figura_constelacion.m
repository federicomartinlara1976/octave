function dibujar_figura_constelacion(nombre_constelacion, ras, decs, color, estilo, ancho)
% DIBUJAR_FIGURA_CONSTELACION Dibuja líneas entre estrellas de constelación

  % Patrones de conexión para constelaciones principales
  switch nombre_constelacion
    case 'Orion'
      % Cazador: hombros, cinturón, piernas
      conexiones = [1,2; 2,3; 4,5; 5,6; 1,4; 3,6; 4,7; 6,7];
      
    case 'Ursa Major'
      % Osa Mayor: el carro
      conexiones = [1,2; 2,3; 3,4; 4,5; 5,6; 6,7; 7,1];
      
    case 'Cassiopeia'
      % Cassiopeia: W
      conexiones = [1,2; 2,3; 3,4; 4,5];
      
    case 'Cygnus'
      % Cygnus: cruz
      conexiones = [1,2; 2,3; 2,4; 2,5];
      
    otherwise
      % Para otras constelaciones, conectar estrellas cercanas
      conexiones = [];
      umbral_distancia = 15; % grados
      
      for i = 1:length(ras)
        for j = i+1:length(ras)
          distancia = sqrt((ras(i)-ras(j))^2 + (decs(i)-decs(j))^2);
          if distancia < umbral_distancia
            conexiones = [conexiones; i, j];
          endif
        endfor
      endfor
  endswitch
  
  % Dibujar líneas
  for i = 1:size(conexiones, 1)
    idx1 = conexiones(i, 1);
    idx2 = conexiones(i, 2);
    
    if idx1 <= length(ras) && idx2 <= length(ras)
      plot([ras(idx1), ras(idx2)], [decs(idx1), decs(idx2)], ...
           estilo, 'color', color, 'linewidth', ancho);
    endif
  endfor
endfunction