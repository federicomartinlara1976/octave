function es_valido = verificar_datos_constelaciones(datos)
% VERIFICAR_DATOS_CONSTELACIONES Valida integridad de datos

  es_valido = false;

  if isempty(datos) || ~isstruct(datos)
    return;
  endif

  campos_requeridos = {'nombre', 'abreviatura', 'ra_min', 'ra_max', 'dec_min', 'dec_max'};

  % Verificar que todos los registros tengan los campos requeridos
  for i = 1:length(datos)
    for j = 1:length(campos_requeridos)
      if ~isfield(datos(i), campos_requeridos{j})
        printf('   ✗ Datos inválidos: falta campo %s\n', campos_requeridos{j});
        return;
      endif
    endfor
  endfor

  % Verificar rangos razonables
  for i = 1:length(datos)
    if datos(i).ra_min < 0 || datos(i).ra_max > 360 || ...
       datos(i).dec_min < -90 || datos(i).dec_max > 90
      printf('   ✗ Datos con rangos inválidos en %s\n', datos(i).nombre);
      return;
    endif
  endfor

  es_valido = true;
  printf('   ✓ Datos validados correctamente (%d constelaciones)\n', length(datos));
endfunction
