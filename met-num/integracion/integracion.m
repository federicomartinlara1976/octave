function [valor, int, error] = integracion(a, b, tolerancia, iteraciones)
  error = "";
  n0 = 14;
  n = n0;
  h = (b-a) / n0;
  sum = simpson(a,b,n,h);
  int(1) = sum;
  ni = 0;
  for j = 2:iteraciones
    n = (2^j) * n0;
    h = (b-a) / n;
    sum = simpson(a,b,n,h);
    int(j) = sum;
    err = (int(j) - int(j-1)) / 15;
    if (abs(err) < tolerancia)
      valor = int(j) + err;
      break;
    endif
    
    ni = j;
  end 
  
  if (ni == iteraciones)
    valor = NaN;
    error = sprintf('Convergencia no lograda tras %d iteraciones', iteraciones);
  endif
endfunction