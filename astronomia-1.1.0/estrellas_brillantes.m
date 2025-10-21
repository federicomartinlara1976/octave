function estrellas = estrellas_brillantes(constelacion, magnitud_limite)
% ESTRELLAS_BRILLANTES Lista estrellas brillantes de una constelación
%   estrellas = estrellas_brillantes(constelacion, magnitud_limite)
%
%   Input:
%     constelacion   - Nombre de la constelación
%     magnitud_limite- Magnitud máxima a incluir

  if nargin < 2
    magnitud_limite = 3.0;
  endif

  % Cargar catálogo de estrellas brillantes
  cat_estrellas = obtener_estrellas_brillantes();

  % Filtrar por constelación y magnitud
  mascara = strcmp({cat_estrellas.constelacion}, constelacion) & ...
            [cat_estrellas.magnitud] <= magnitud_limite;

  estrellas = cat_estrellas(mascara);

  printf('Estrellas brillantes en %s (mag ≤ %.1f):\n', constelacion, magnitud_limite);

  if isempty(estrellas)
    printf('  No se encontraron estrellas\n');
  else
    % Ordenar por magnitud (más brillantes primero)
    [~, idx] = sort([estrellas.magnitud]);
    estrellas = estrellas(idx);

    for i = 1:length(estrellas)
      printf('  %-12s mag=%.1f (RA=%.2fh, Dec=%.1f°)\n', ...
             estrellas(i).nombre, estrellas(i).magnitud, ...
             estrellas(i).ra, estrellas(i).dec);
    endfor
  endif
endfunction
