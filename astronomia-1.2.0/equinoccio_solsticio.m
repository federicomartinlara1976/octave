function [JDE, fecha_utc, fecha_local, offset_horas] = equinoccio_solsticio(year, event, zona)
% EQUINOCCIO_SOLSTICIO_LOCAL  Solsticios y equinoccios en hora local.
%
% Uso:
%   [JDE, utc, local] = equinoccio_solsticio(2026, 'june_solstice', 'Europe/Madrid')
%   [JDE, utc, local] = equinoccio_solsticio(2026, 'june_solstice', +2)
%
% Entradas:
%   year  : año (entero)
%   event : 'march_equinox' | 'june_solstice' | 'september_equinox' | 'december_solstice'
%   zona  : (opcional) puede ser:
%             - un string con el nombre IANA ('Europe/Madrid', 'America/Bogota', ...)
%             - un escalar numérico con el offset en horas respecto a UTC
%           Si se omite, se usa 'Europe/Madrid' por defecto.
%
% Salidas:
%   JDE          : Día Juliano del evento en TT (tal cual lo devuelve el .oct)
%   fecha_utc    : [año mes día hora min seg] en UTC
%   fecha_local  : [año mes día hora min seg] en hora local
%   offset_horas : desfase aplicado en horas (útil para depurar)

    if nargin < 3 || isempty(zona)
        zona = 'Europe/Madrid';
    end

    % --- 1) Llamada al .oct (TT y UTC) ---
    [JDE, fecha_utc] = meeus_equinox_solstice(year, event);

    % --- 2) Determinar el offset en horas respecto a UTC ---
    if ischar(zona) || isstring(zona)
        offset_horas = tz_offset_octave(fecha_utc, char(zona));
    else
        offset_horas = double(zona);
    end

    % --- 3) Aplicar el offset a la fecha UTC ---
    fecha_local = sumar_horas(fecha_utc, offset_horas);
end

% -------------------------------------------------------------------------
% Aplica un desplazamiento en horas a un vector fecha [Y m d H M S]
% -------------------------------------------------------------------------
function fv = sumar_horas(fv, horas)
    % Convertir el vector fecha a Día Juliano, sumar el offset, y volver.
    jd = datevec2jd(fv);
    jd = jd + horas / 24.0;
    fv = jd2datevec_octave(jd);
end

% -------------------------------------------------------------------------
% Vector fecha [Y m d H M S] -> Día Juliano (algoritmo de Meeus, cap. 7)
% -------------------------------------------------------------------------
function jd = datevec2jd(fv)
    Y = fv(1); M = fv(2); D = fv(3);
    H = fv(4); Mi = fv(5); S = fv(6);

    % Parte entera y fraccionaria del día
    dia_frac = D + (H + (Mi + S/60)/60)/24;

    if M <= 2
        Y = Y - 1;
        M = M + 12;
    end

    if (Y > 1582) || (Y == 1582 && M > 10) || (Y == 1582 && M == 10 && D >= 15)
        A = floor(Y / 100);
        B = 2 - A + floor(A / 4);
    else
        B = 0;
    end

    jd = floor(365.25 * (Y + 4716)) + floor(30.6001 * (M + 1)) ...
         + dia_frac + B - 1524.5;
end

% -------------------------------------------------------------------------
% Día Juliano -> vector fecha [Y m d H M S] (algoritmo de Meeus, cap. 7)
% -------------------------------------------------------------------------
function dv = jd2datevec_octave(jd)
    jd = jd + 0.5;
    Z = floor(jd);
    F = jd - Z;

    if Z < 2299161
        A = Z;
    else
        alpha = floor((Z - 1867216.25) / 36524.25);
        A = Z + 1 + alpha - floor(alpha / 4);
    end

    B = A + 1524;
    C = floor((B - 122.1) / 365.25);
    D = floor(365.25 * C);
    E = floor((B - D) / 30.6001);

    dia = B - D - floor(30.6001 * E) + F;
    if E < 14
        mes = E - 1;
    else
        mes = E - 13;
    end
    if mes > 2
        anyo = C - 4716;
    else
        anyo = C - 4715;
    end

    dia_int = floor(dia);
    frac = dia - dia_int;
    horas_tot = frac * 24;
    h = floor(horas_tot);
    min_tot = (horas_tot - h) * 60;
    m = floor(min_tot);
    s = (min_tot - m) * 60;

    dv = [anyo, mes, dia_int, h, m, s];
end
