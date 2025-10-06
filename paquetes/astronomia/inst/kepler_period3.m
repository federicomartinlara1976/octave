% Ejemplo: Movimiento circular para órbitas
function period = kepler_period3(a)
    % Periodo orbital (ley de Kepler)
    % a en UA, periodo en años
    period = sqrt(a.^3);
end