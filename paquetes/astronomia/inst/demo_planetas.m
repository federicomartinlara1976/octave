% --- posicion_planeta.m ---
% Efemérides planetarias básicas

function demo_planetas()
% DEMO_PLANETAS Demostración de planetas
    printf('\n--- DEMO PLANETAS ---\n');
    fecha = now();
    planetas = {'Mercurio', 'Venus', 'Marte', 'Júpiter', 'Saturno'};
    
    for i = 1:5
        [ra, dec, dist] = posicion_planeta(i, fecha);
        printf('%s: RA=%.2fh, Dec=%.2f°, Dist=%.2f UA\n', ...
               planetas{i}, ra, dec, dist);
    endfor
endfunction
