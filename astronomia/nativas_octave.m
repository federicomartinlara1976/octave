% Ejemplo: Movimiento circular para órbitas
function period = kepler_period3(a)
    % Periodo orbital (ley de Kepler)
    % a en UA, periodo en años
    period = sqrt(a.^3);
end

% Para una órbita terrestre (a=1 UA)
periodo_tierra = kepler_period3(1);
printf("Periodo orbital Tierra: %.2f años\n", periodo_tierra);

% Velocidad orbital circular
function vel = orbital_velocity(a)
    % a en UA, velocidad en km/s
    G = 1.327e20;  % Constante gravitacional solar (m^3/s^2)
    r = a * 1.496e11;  % Convertir UA a metros
    vel = sqrt(G / r) / 1000;  % Convertir a km/s
end

vel_tierra = orbital_velocity(1);
printf("Velocidad orbital Tierra: %.2f km/s\n", vel_tierra);