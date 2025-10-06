% --- astronomia.m ---
% Función principal del paquete

function astronomia(cmd)
% ASTRONOMIA Paquete de funciones astronómicas
%
%   astronomia()          - Muestra ayuda básica
%   astronomia('version') - Muestra versión
%   astronomia('test')    - Ejecuta tests
%   astronomia('demo')    - Ejecuta demostración

  if nargin == 0
    mostrar_ayuda();
    return;
  endif
  
  switch (cmd)
    case 'version'
      printf('Astronomia v1.0.0\n');
      printf('Estructura modular con múltiples archivos\n');
    
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
