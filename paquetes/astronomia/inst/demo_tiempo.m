% --- calcular_lst.m ---
% Funciones de tiempo astronómico

function demo_tiempo()
% DEMO_TIEMPO Demostración de tiempo
    printf('\n--- DEMO TIEMPO ---\n');
    lst = calcular_lst(now(), -3.7);
    printf('Tiempo Sidéreo Local: %.4f horas\n', lst);
endfunction
