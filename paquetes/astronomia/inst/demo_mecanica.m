function demo_mecanica()
% DEMO_MECANICA Demostración de mecánica celeste simbólica

    printf('\n=== MECÁNICA CELESTE SIMBÓLICA ===\n');

    % 1. Leyes de Kepler
    printf('\n1. LEYES DE KEPLER SIMBÓLICAS:\n');
    [T_sym, v_sym, E_sym] = leyes_kepler_simbolicas();

    % 2. Definir variables simbólicas para la sustitución
    syms G M a e T positive

    % 3. Sustituir valores numéricos (Tierra)
    G_val = sym('6.67430e-11');  % m^3 kg^-1 s^-2
    M_sol = sym('1.989e30');     % kg
    a_tierra = sym('1.496e11');  % m
    e_tierra = sym('0.0167');    % Excentricidad Tierra

    % Calcular período orbital
    T_sol = solve(T_sym, T);  % Despejar T
    T_num = double(subs(T_sol, {G, M, a}, {G_val, M_sol, a_tierra}));

    printf('\nPeríodo orbital terrestre:\n');
    printf('  Teórico: %.0f segundos\n', T_num);
    printf('  Equivalente: %.2f años\n', T_num/(365.25*24*3600));
    printf('  Real: 365.25 días (diferencia: %.4f años)\n', T_num/(365.25*24*3600) - 1);

    % 4. Velocidades orbitales
    v_peri_num = double(subs(v_sym(1), {G, M, a, e}, {G_val, M_sol, a_tierra, e_tierra}));
    v_afe_num = double(subs(v_sym(2), {G, M, a, e}, {G_val, M_sol, a_tierra, e_tierra}));

    printf('\nVelocidades orbitales terrestres:\n');
    printf('  Perihelio: %.1f km/s\n', v_peri_num/1000);
    printf('  Afelio: %.1f km/s\n', v_afe_num/1000);
    printf('  Diferencia: %.1f km/s\n', (v_peri_num - v_afe_num)/1000);

    % 5. Resolver ecuación de Kepler
    printf('\n2. ECUACIÓN DE KEPLER:\n');

    % Caso 1: Anomalía media de 45°, excentricidad 0.1
    M_45 = deg2rad(45);
    e_01 = 0.1;

    % Resolver numéricamente
    E_sol_45 = fsolve(@(E) E - e_01*sin(E) - M_45, M_45);

    printf('  Para M=45°, e=0.1:\n');
    printf('    Anomalía excéntrica: %.2f°\n', rad2deg(E_sol_45));
    printf('    Diferencia E-M: %.2f°\n', rad2deg(E_sol_45 - M_45));

    % Caso 2: Anomalía media de 90°, excentricidad 0.5 (órbita más excéntrica)
    M_90 = deg2rad(90);
    e_05 = 0.5;
    E_sol_90 = fsolve(@(E) E - e_05*sin(E) - M_90, M_90);

    printf('  Para M=90°, e=0.5:\n');
    printf('    Anomalía excéntrica: %.2f°\n', rad2deg(E_sol_90));
    printf('    Diferencia E-M: %.2f°\n', rad2deg(E_sol_90 - M_90));

    % 6. Demostración de conservación de energía (CORREGIDO)
    printf('\n3. ENERGÍA ORBITAL:\n');

    % Convertir a double para evitar problemas con printf
    E_total = double(-G_val * M_sol / (2 * a_tierra));  % Por unidad de masa
    v_circular = double(sqrt(G_val * M_sol / a_tierra));

    printf('  Energía orbital específica: %.1e J/kg\n', E_total);
    printf('  Velocidad circular a 1 UA: %.1f km/s\n', v_circular/1000);

    % Energía cinética y potencial en perihelio/afelio
    r_peri = a_tierra * (1 - e_tierra);
    r_afe = a_tierra * (1 + e_tierra);

    E_pot_peri = double(-G_val * M_sol / r_peri);
    E_pot_afe = double(-G_val * M_sol / r_afe);

    E_cin_peri = double(0.5 * v_peri_num^2);
    E_cin_afe = double(0.5 * v_afe_num^2);

    printf('  Verificación conservación energía:\n');
    printf('    Perihelio: Ecin=%.1e J/kg, Epot=%.1e J/kg, Total=%.1e J/kg\n', ...
           E_cin_peri, E_pot_peri, E_cin_peri + E_pot_peri);
    printf('    Afelio:    Ecin=%.1e J/kg, Epot=%.1e J/kg, Total=%.1e J/kg\n', ...
           E_cin_afe, E_pot_afe, E_cin_afe + E_pot_afe);

    printf('\n✅ Demostración completada\n');
endfunction
