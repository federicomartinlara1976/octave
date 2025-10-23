function campos = dividir_linea_csv(linea)
% DIVIDIR_LINEA_CSV Divide una línea CSV manejando campos vacíos
  campos = {};
  campo_actual = '';
  entre_comillas = false;
  
  for i = 1:length(linea)
    caracter = linea(i);
    
    if caracter == '"'
      entre_comillas = ~entre_comillas;
    elseif caracter == ',' && ~entre_comillas
      campos{end+1} = campo_actual;
      campo_actual = '';
    else
      campo_actual = [campo_actual, caracter];
    endif
  endfor
  
  % Añadir el último campo
  campos{end+1} = campo_actual;
endfunction