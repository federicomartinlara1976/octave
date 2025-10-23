function campos_completos = rellenar_campos_faltantes(campos)
% RELLENAR_CAMPOS_FALTANTES Completa los campos faltantes con valores por defecto
  campos_completos = cell(1, 9);
  
  for i = 1:length(campos)
    campos_completos{i} = campos{i};
  endfor
  
  % Rellenar campos faltantes
  for i = (length(campos)+1):9
    switch i
      case 2  % nombre
        campos_completos{i} = campos_completos{1};  % Usar catálogo como nombre
      case 8  % tamano
        campos_completos{i} = '0';
      case 9  % descripcion
        campos_completos{i} = 'Sin descripción';
      otherwise
        campos_completos{i} = '';
    endswitch
  endfor
endfunction