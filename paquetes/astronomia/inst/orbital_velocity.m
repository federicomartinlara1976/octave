% Velocidad orbital circular
function vel = orbital_velocity(a)
    % a en UA, velocidad en km/s
    G = 1.327e20;  % Constante gravitacional solar (m^3/s^2)
    r = a * 1.496e11;  % Convertir UA a metros
    vel = sqrt(G / r) / 1000;  % Convertir a km/s
end