% --- calcular_lst.m ---
% Funciones de tiempo astronómico

function jd = fecha_juliana(anio, mes, dia, hora, minuto, segundo)
% FECHA_JULIANA Calcula la fecha juliana
    if nargin < 4
        hora = 0; minuto = 0; segundo = 0;
    endif
    
    if mes <= 2
        anio = anio - 1;
        mes = mes + 12;
    endif
    
    a = floor(anio / 100);
    b = 2 - a + floor(a / 4);
    
    jd = floor(365.25 * (anio + 4716)) + ...
         floor(30.6001 * (mes + 1)) + ...
         dia + b - 1524.5 + ...
         (hora + minuto/60 + segundo/3600) / 24;
endfunction
