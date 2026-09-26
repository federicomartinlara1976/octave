function grados = hms2deg(h, m, s)
% HMS2DEG Convierte horas, minutos, segundos a grados
    if nargin == 1
        % h es un vector [h, m, s]
        if length(h) == 3
            grados = h(1) * 15 + h(2) * 0.25 + h(3) * 0.00416667;
        else
            error('Vector debe tener 3 elementos [h, m, s]');
        endif
    else
        grados = h * 15 + m * 0.25 + s * 0.00416667;
    endif
endfunction
