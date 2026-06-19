function color = color_por_tipo_espectral(tipo)
% COLOR_POR_TIPO_ESPECTRAL Asigna color según tipo espectral

  if isempty(tipo)
    color = [0, 0, 0];  % Negro
    return;
  endif
  
  primer_caracter = tipo(1);
  
  switch primer_caracter
    case 'O'
      color = [0.2, 0.4, 1.0];    % Azul intenso
    case 'B'
      color = [0.5, 0.7, 1.0];    % Azul claro
    case 'A'
      color = [1.0, 1.0, 1.0];    % Blanco
    case 'F'
      color = [1.0, 1.0, 0.6];    % Amarillo suave
    case 'G'
      color = [1.0, 1.0, 0.3];    % Amarillo más intenso (como el Sol)
    case 'K'
      color = [1.0, 0.6, 0.2];    % Naranja
    case 'M'
      color = [1.0, 0.2, 0.1];    % Rojo
    otherwise
      color = [1.0, 1.0, 1.0];    % Blanco por defecto
  endswitch
endfunction