function [ra, dec, dist] = posicion_planeta_simple(planeta, fecha)
% POSICION_PLANETA_SIMPLE Posición aproximada de planetas

  % Posiciones simplificadas (en una implementación real usarías efemérides precisas)
  switch lower(planeta)
    case 'mercury'
      ra = 10.5; dec = 10.0; dist = 0.6;
    case 'venus'
      ra = 12.0; dec = 5.0; dist = 0.8;
    case 'mars'
      ra = 14.5; dec = -10.0; dist = 1.2;
    case 'jupiter'
      ra = 16.0; dec = -15.0; dist = 4.5;
    case 'saturn'
      ra = 17.5; dec = -20.0; dist = 9.0;
    otherwise
      ra = NaN; dec = NaN; dist = NaN;
  endswitch
endfunction