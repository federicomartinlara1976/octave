function color = color_por_tipo_espectral(tipo)
% COLOR_POR_TIPO_ESPECTRAL Asigna color según tipo espectral

  if isempty(tipo)
    color = 'black';
    return;
  endif
  
  primer_caracter = tipo(1);
  
  switch primer_caracter
    case 'O'
      color = 'blue';
    case 'B'
      color = 'lightblue';
    case 'A'
      color = 'white';
    case 'F'
      color = 'yellow';
    case 'G'
      color = 'yellow';
    case 'K'
      color = 'orange';
    case 'M'
      color = 'red';
    otherwise
      color = 'white';
  endswitch
endfunction