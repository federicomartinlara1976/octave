% --- calcular_lst.m ---
% Funciones de tiempo astronómico

function test_tiempo()
% TEST_TIEMPO Ejecuta tests de tiempo
    printf('Testing tiempo... ');
    lst = calcular_lst(datenum(2024,1,1,0,0,0), 0);
    assert(lst > 0 && lst < 24, true);
    printf('OK\n');
endfunction
