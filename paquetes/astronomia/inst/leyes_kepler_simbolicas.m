function [T_sym, v_sym, E_sym] = leyes_kepler_simbolicas()
% LEYES_KEPLER_SIMBÓLICAS Define las leyes de Kepler de forma simbólica

    % Definir todas las variables simbólicas de una vez
    syms a T G M e n E t P real
    assume([a T G M e n E t P], 'positive')

    % Usar pi simbólico en lugar de pi numérico
    pi_sym = sym('pi');

    % Tercera Ley de Kepler (forma general)
    T_sym = T == 2*pi_sym*sqrt(a^3/(G*M));

    % Velocidad orbital en diferentes puntos
    v_perihelio = sqrt(G*M*(1+e)/(a*(1-e)));  % Perihelio
    v_afelio = sqrt(G*M*(1-e)/(a*(1+e)));     % Afelio
    v_sym = [v_perihelio, v_afelio];

    % Ecuación de Kepler: M = E - e*sin(E)
    M_angle = n*(t - P);  % Anomalía media
    kepler_eq = M_angle == E - e*sin(E);
    E_sym = kepler_eq;

    printf('Leyes de Kepler definidas simbólicamente:\n');
    printf('1. Tercera Ley: T = 2π√(a³/GM)\n');
    printf('2. Velocidades orbitales:\n');
    printf('   - Perihelio: v = √[GM(1+e)/a(1-e)]\n');
    printf('   - Afelio:    v = √[GM(1-e)/a(1+e)]\n');
    printf('3. Ecuación de Kepler: M = E - e·sin(E)\n');
endfunction
