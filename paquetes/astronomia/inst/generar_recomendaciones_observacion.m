function generar_recomendaciones_observacion(lst, lat, lon)
% GENERAR_RECOMENDACIONES_OBSERVACION Recomienda objetos para observar

  constelaciones = obtener_limites_constelaciones();
  objetos = obtener_objetos_profundos();
  
  recomendaciones = {};
  
  % Buscar constelaciones bien situadas
  for i = 1:length(constelaciones)
    const = constelaciones(i);
    [visible, porcentaje] = constelacion_visible(const, lst, lat, 6.0);
    
    if visible && porcentaje > 0.7  % Bien sobre el horizonte
      % Verificar si tiene objetos interesantes
      objetos_const = objetos(strcmp({objetos.constelacion}, const.nombre));
      
      if ~isempty(objetos_const)
        % Encontrar el objeto más brillante
        [mag_min, idx] = min([objetos_const.magnitud]);
        obj = objetos_const(idx);
        
        if mag_min < 7.0  # Objeto observable con prismáticos
          recomendaciones{end+1} = struct(...
            'objeto', obj.catalogo, ...
            'nombre', obj.nombre, ...
            'constelacion', const.nombre, ...
            'magnitud', mag_min, ...
            'tipo', obj.tipo);
        endif
      endif
    endif
  endfor
  
  % Mostrar recomendaciones
  if isempty(recomendaciones)
    printf('   💡 Cielo no favorable. Mejor probar en otra hora.\n');
  else
    for i = 1:min(3, length(recomendaciones))
      rec = recomendaciones{i};
      printf('   %s (%s) - %s - mag %.1f\n', ...
             rec.objeto, rec.nombre, rec.tipo, rec.magnitud);
    endfor
  endif
endfunction