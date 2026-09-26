function nombre = constelacion_por_coordenadas(ra, dec)
% CONSTELACION_POR_COORDENADAS Identifica constelación por coordenadas
%   nombre = constelacion_por_coordenadas(ra, dec)
%
%   Input:
%     ra  - Ascensión Recta en horas
%     dec - Declinación en grados
%
%   Output:
%     nombre - Nombre de la constelación

  % Cargar datos de constelaciones
  datos = obtener_limites_constelaciones();

  ra_grados = ra * 15;  % Convertir a grados

  % Buscar en qué constelación están las coordenadas
  nombre = 'Desconocida';

  for i = 1:length(datos)
    if ra_grados >= datos(i).ra_min && ra_grados <= datos(i).ra_max && ...
       dec >= datos(i).dec_min && dec <= datos(i).dec_max
      nombre = datos(i).nombre;
      break;
    endif
  endfor

  printf('Coordenadas: RA=%.2fh, Dec=%.2f° → %s\n', ra, dec, nombre);
endfunction
