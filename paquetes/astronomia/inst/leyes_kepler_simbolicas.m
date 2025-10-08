function [T_sym, v_sym, E_sym] = leyes_kepler_simbolicas()
% LEYES_KEPLER_SIMBOLICAS Define las leyes de Kepler de forma simbólica

    syms a T G M positive  % Semieje, período, constante G, masa central
    syms e n E t P positive % Excentricidad, movimiento medio, anomalía excéntrica, tiempo, período

    % Tercera Ley de Kepler (forma general)
    T_sym = T == 2*pi*sqrt(a^3/(G*M));

    % Velocidad orbital en diferentes puntos
    v_perihelio = sqrt(G*M*(1+e)/a/(1-e));  % Perihelio
    v_afelio = sqrt(G*M*(1-e)/a/(1+e));     % Afelio
    v_sym = [v_perihelio, v_afelio];

    % Ecuación de Kepler: M = E - e*sin(E)
    M_angle = n*(t - P);  % Anomalía media
    kepler_eq = M_angle == E - e*sin(E);
    E_sym = kepler_eq;

    printf('Leyes de Kepler definidas simbólicamente:\n');
    printf('1. Tercera Ley: %s\n', char(T_sym));
    printf('2. Velocidades: Perihelio=%s, Afelio=%s\n', char(v_perihelio), char(v_afelio));
    printf('3. Ecuación de Kepler: %s\n', char(kepler_eq));
endfunction
