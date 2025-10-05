% --- altaz2hadec.m ---
% Funciones de conversión de coordenadas

function test_coordenadas()
% TEST_COORDENADAS Ejecuta tests de coordenadas
    printf('Testing coordenadas... ');
    [ha, dec] = altaz2hadec(90, 0, 40.4);
    assert(dec, 40.4, 1e-5);
    printf('OK ✅\n');
endfunction
