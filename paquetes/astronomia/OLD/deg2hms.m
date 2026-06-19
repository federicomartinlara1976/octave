function hms = deg2hms(grados)
% DEG2HMS Convierte grados a horas, minutos, segundos
    horas = grados / 15;
    h = floor(horas);
    m = floor((horas - h) * 60);
    s = ((horas - h) * 60 - m) * 60;
    hms = [h, m, s];
endfunction
