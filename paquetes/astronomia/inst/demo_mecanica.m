function demo_mecanica()
% DEMO_MECANICA Demostración de mecánica celeste simbólica

    printf('\n=== MECÁNICA CELESTE SIMBÓLICA ===\n');

    % 1. Leyes de Kepler
    printf('\n1. LEYES DE KEPLER SIMBÓLICAS:\n');
    [T_sym, v_sym, E_sym] = leyes_kepler_simbolicas();

    % 2. Sustituir valores numéricos (Tierra)
    G_val = 6.67430e-11;  % m^3 kg^-1 s^-2
    M_sol = 1.989e30;     % kg
    a_tierra = 1.496e11;  % m

    T_num = solve(subs(T_sym, [G, M, a], [G_val, M_sol, a_tierra]), T);
    printf('\nPeríodo orbital terrestre: %.0f segundos (%.2f años)\n', ...
           double(T_num), double(T_num)/(365.25*24*3600));

    % 3. Velocidades orbitales
    v_peri_num = double(subs(v_sym(1), [G, M, a, e], [G_val, M_sol, a_tierra, 0.0167]));
    v_afe_num = double(subs(v_sym(2), [G, M, a, e], [G_val, M_sol, a_tierra, 0.0167]));
    printf('Velocidad Tierra: Perihelio=%.1f km/s, Afelio=%.1f km/s\n', ...
           v_peri_num/1000, v_afe_num/1000);

    % 4. Resolver ecuación de Kepler
    printf('\n2. ECUACIÓN DE KEPLER:\n');
    e_val = 0.1;
    M_val = deg2rad(45);  % 45° anomalía media
    E_sol = solve(subs(E_sym, [e, M_angle], [e_val, M_val]), E);
    printf('Anomalía excéntrica para M=45°, e=0.1: %.2f°\n', rad2deg(double(E_sol)));
endfunction
