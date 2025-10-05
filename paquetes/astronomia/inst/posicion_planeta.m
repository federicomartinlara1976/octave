% --- posicion_planeta.m ---
% Efemérides planetarias básicas

function [ra, dec, distancia] = posicion_planeta(planeta, fecha)
% POSICION_PLANETA Posición aproximada de planetas
    elementos = [
        0.387, 0.2056, 7.005, 48.331, 77.456, 252.251;
        0.723, 0.0067, 3.395, 76.680, 131.533, 181.980;
        1.524, 0.0934, 1.850, 49.558, 336.040, 355.453;
        5.204, 0.0489, 1.304, 100.556, 14.753, 34.404;
        9.582, 0.0565, 2.485, 113.715, 92.432, 49.944
    ];
    
    if planeta < 1 || planeta > 5
        error('Planeta debe ser entre 1 y 5');
    endif
    
    a = elementos(planeta, 1);
    periodo = sqrt(a^3);
    fase = mod(fecha, periodo * 365) / (periodo * 365) * 360;
    
    ra = mod(fase / 15, 24);
    dec = elementos(planeta, 3);
    distancia = a;
endfunction
