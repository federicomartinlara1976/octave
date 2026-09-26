function info_constelacion(nombre)
% INFO_CONSTELACION Información detallada de una constelación
%   info_constelacion(nombre)

  datos = obtener_info_constelaciones();

  encontrada = false;
  for i = 1:length(datos)
    if strcmpi(datos(i).nombre, nombre)
      const = datos(i);
      encontrada = true;
      break;
    endif
  endfor

  if ~encontrada
    printf('Constelación "%s" no encontrada\n', nombre);
    return;
  endif

  printf('\n=== CONSTELACIÓN: %s ===\n', upper(const.nombre));
  printf('Nombre español: %s\n', const.nombre_es);
  printf('Abreviatura: %s\n', const.abreviatura);
  printf('Genitivo: %s\n', const.genitivo);
  printf('Área: %.1f grados² (%.1f%% del cielo)\n', const.area, const.area/41253*100);
  printf('Ascensión Recta: %.1f a %.1f horas\n', const.ra_min/15, const.ra_max/15);
  printf('Declinación: %.1f° a %.1f°\n', const.dec_min, const.dec_max);
  printf('Estrellas principales: %d\n', const.estrellas_principales);
  printf('Mitología: %s\n', const.mitologia);
  printf('Mejor visible: %s\n', const.mejor_visible);

  % Mostrar estrellas brillantes
  estrellas_brillantes(nombre, 3.5);
endfunction
