function ejecutar_tests()
  printf('\nEjecutando tests de todos los módulos...\n');
  % Los tests específicos están en cada archivo
  test_coordenadas();
  test_tiempo();
  test_conversiones();
  printf('Todos los tests completados! \n');
endfunction
