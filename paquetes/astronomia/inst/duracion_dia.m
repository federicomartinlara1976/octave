function duracion = duracion_dia(fecha, lat, lon)
% DURACION_DIA Calcula la duración del día (CORREGIDO)

  [salida, puesta] = salida_puesta_sol(fecha, lat, lon);

  if isnan(salida) || isnan(puesta)
    duracion = 0;
    printf('Duración del día: %.1f horas\n', duracion);
  else
    duracion = (puesta - salida) * 24;
    if duracion < 0
      duracion = duracion + 24;  % Corregir si cruza medianoche
    endif
    printf('Duración del día: %.1f horas\n', duracion);
  endif
endfunction
