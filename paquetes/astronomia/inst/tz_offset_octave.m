function offset = tz_offset_octave(fecha_utc, zona)
% TZ_OFFSET_OCTAVE  Devuelve el offset en horas de una zona IANA
% para una fecha UTC dada, usando el comando 'date' del sistema.
%
% Solo válido en sistemas con coreutils (Linux, macOS).

    % Formato de fecha que entiende 'date'
    str_utc = sprintf('%04d-%02d-%02d %02d:%02d:%02d', ...
                      fecha_utc(1), fecha_utc(2), fecha_utc(3), ...
                      fecha_utc(4), fecha_utc(5), round(fecha_utc(6)));

    % Pedimos a 'date' el offset numérico en esa zona
    cmd = sprintf('TZ="%s" date -d "%s UTC" +%%z', zona, str_utc);
    [status, salida] = system(cmd);

    if status ~= 0
        error('No se pudo obtener el offset para la zona "%s".', zona);
    end

    % salida tiene el formato +HHMM o -HHMM
    salida = strtrim(salida);
    signo  = 1;
    if salida(1) == '-'
        signo = -1;
    end
    hh = str2double(salida(2:3));
    mm = str2double(salida(4:5));
    offset = signo * (hh + mm/60);
end