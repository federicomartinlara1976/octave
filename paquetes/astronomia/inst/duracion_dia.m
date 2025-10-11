function duracion = duracion_dia(fecha, lat, lon)
% DURACION_DIA Calcula la duración del día
%   duracion = duracion_dia(fecha, lat, lon)

  [salida, puesta] = salida_puesta_sol(fecha, lat, lon);

  if isnan(salida) || isnan(puesta)
    duracion = 0;
    printf('Duración del día: %.1f horas (Sol de medianoche/noche polar)\n', duracion);
  else
    duracion = (puesta - salida) * 24;  % Horas
    printf('Duración del día: %.1f horas\n', duracion);
  endif
endfunction
