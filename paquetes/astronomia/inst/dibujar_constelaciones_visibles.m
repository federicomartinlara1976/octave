function dibujar_constelaciones_visibles(lst, lat, magnitud_limite, constelaciones_destacadas)
% DIBUJAR_CONSTELACIONES_VISIBLES Dibuja constelaciones en el mapa

  constelaciones = obtener_limites_constelaciones(true);
  estrellas = obtener_estrellas_brillantes();
  
  % Filtrar estrellas por magnitud
  estrellas_visibles = estrellas([estrellas.magnitud] <= magnitud_limite);
  
  % Dibujar cada constelación
  for i = 1:length(constelaciones)
    const = constelaciones(i);
    
    % Verificar visibilidad
    [es_visible, porcentaje] = constelacion_visible(const, lst, lat, magnitud_limite);
    
    if es_visible
      % Estrellas de esta constelación
      estrellas_const = estrellas_visibles(strcmp({estrellas_visibles.constelacion}, const.nombre));
      
      if ~isempty(estrellas_const)
        % Determinar color y tamaño según si está destacada
        if any(strcmp(constelaciones_destacadas, const.nombre))
          color = [1, 0, 0];
          tamano = 8;
          estilo_linea = '-';
          ancho_linea = 2;
        else
          color = [0, 0, 1];
          tamano = 4;
          estilo_linea = ':';
          ancho_linea = 1;
        endif
        
        % Dibujar estrellas
        ras = [estrellas_const.ra];
        decs = [estrellas_const.dec];
        magnitudes = [estrellas_const.magnitud];
        
        % Tamaño proporcional al brillo (magnitud más negativa = más brillante)
        tamanos = 8.0 - magnitudes * 1.5;
        tamanos = max(tamanos, 2);  % Mínimo tamaño
        
        scatter(ras, decs, tamanos, color, 'filled', 'displayname', const.nombre);
        
        % Dibujar líneas de la constelación si está destacada
        if any(strcmp(constelaciones_destacadas, const.nombre))
          printf('Dibujar figura para %s\n', const.nombre);
          dibujar_figura_constelacion(const.nombre, ras, decs, color, estilo_linea, ancho_linea);
        endif
        
        % Etiquetar estrellas muy brillantes
        for j = 1:length(estrellas_const)
          if estrellas_const(j).magnitud < 1.0
            text(ras(j), decs(j) + 2, estrellas_const(j).nombre, ...
                 'fontsize', 14, 'horizontalalignment', 'center');
          endif
        endfor
      endif
    endif
  endfor
endfunction