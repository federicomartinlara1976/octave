% --- astronomia.m ---
% Función principal del paquete

function astronomia(cmd)
% ASTRONOMIA Paquete de funciones astronómicas
%
%   astronomia()          - Muestra ayuda básica
%   astronomia('version') - Muestra versión
%   astronomia('about')   - Muestra Acerca de...
%   astronomia('test')    - Ejecuta tests
%   astronomia('demo')    - Ejecuta demostración

  astronomia_version = '1.1.0';

  if nargin == 0
    mostrar_ayuda();
    return;
  endif
  
  switch (cmd)
    case 'version'
      printf('%s\n', astronomia_version);
      
    case 'about'
      printf('Astronomia v%s\n', astronomia_version);
      printf('Paquete para cálculos astronómicos\n');
    
    case 'test'
      ejecutar_tests();
    
    case 'demo'
      ejecutar_demo();
    
    case 'help'
      mostrar_ayuda();
    
    otherwise
      printf('Comando no reconocido: %s\n', cmd);
      printf('Use astronomia() para ayuda.\n');
  endswitch
  
endfunction
