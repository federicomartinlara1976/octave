function dibujar_constelaciones_visibles_grande(lst, lat, magnitud_limite, constelaciones_destacadas)
% Versión con texto de constelaciones más grande

  % Usar tu función robusta que ya existe
  constelaciones = cargar_constelaciones_robusto();

  % Ahora procesar las constelaciones con texto grande
  for i = 1:length(constelaciones)
    const = constelaciones(i);
    
    % Determinar si la constelación es visible
    es_visible = false;
    if isfield(const, 'estrellas') && ~isempty(const.estrellas)
      % Verificar si alguna estrella está sobre el horizonte
      for j = 1:length(const.estrellas)
        estrella = const.estrellas(j);
        if calcular_altura(estrella.ascension_recta, estrella.declinacion, lst, lat) > 0
          es_visible = true;
          break;
        endif
      endfor
    endif
    
    if es_visible
      % Determinar estilo según si es destacada
      if any(strcmp(constelaciones_destacadas, const.nombre))
        color_linea = [1, 0, 0];  % Rojo para destacadas
        ancho_linea = 2.5;
        estilo_linea = '-';
        tamano_texto = 13;  % Texto más grande para destacadas
      else
        color_linea = [0.3, 0.3, 0.8];  % Azul para el resto
        ancho_linea = 1.5;
        estilo_linea = '--';
        tamano_texto = 11;  % Texto grande normal
      endif
      
      % Dibujar líneas de conexión (si existen)
      if isfield(const, 'conexiones') && ~isempty(const.conexiones)
        for j = 1:size(const.conexiones, 1)
          idx1 = const.conexiones(j, 1);
          idx2 = const.conexiones(j, 2);
          
          if idx1 <= length(const.estrellas) && idx2 <= length(const.estrellas)
            estrella1 = const.estrellas(idx1);
            estrella2 = const.estrellas(idx2);
            
            plot(gca, [estrella1.ascension_recta, estrella2.ascension_recta], ...
                 [estrella1.declinacion, estrella2.declinacion], ...
                 estilo_linea, 'Color', color_linea, 'LineWidth', ancho_linea);
          endif
        endfor
      endif
      
      % Dibujar nombre de constelación con TEXTO MÁS GRANDE
      if isfield(const, 'estrellas') && ~isempty(const.estrellas)
        ar_medio = mean([const.estrellas.ascension_recta]);
        dec_medio = mean([const.estrellas.declinacion]);
        
        text(gca, ar_medio, dec_medio, const.nombre, ...
             'FontSize', tamano_texto, 'FontWeight', 'bold', ...
             'HorizontalAlignment', 'center', ...
             'BackgroundColor', 'white', 'Margin', 3, ...
             'EdgeColor', color_linea);
      endif
    endif
  endfor
endfunction