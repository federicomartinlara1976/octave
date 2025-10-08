function [r_vec, v_vec] = orbita_simbolica(a, e, i, Omega, omega, nu)
% ORBITA_SIMBOLICA Vector de posición y velocidad en elementos orbitales

    syms G M positive

    % Parámetros orbitales
    p = a*(1 - e^2);  % Semilatus rectum
    r = p/(1 + e*cos(nu));  % Distancia radial

    % Vector de posición en el plano orbital
    r_planar = [r*cos(nu); r*sin(nu); 0];

    % Vector de velocidad en el plano orbital
    h = sqrt(G*M*p);  % Momento angular
    v_planar = [-sqrt(G*M/p)*sin(nu); sqrt(G*M/p)*(e + cos(nu)); 0];

    % Matrices de rotación (simplificadas)
    % (Aquí podrías expandir con rotaciones 3D completas)

    r_vec = r_planar;
    v_vec = v_planar;

    printf('Órbita definida para:\n');
    printf('  a=%.2f, e=%.2f, i=%.1f°, Ω=%.1f°, ω=%.1f°, ν=%.1f°\n', ...
           a, e, rad2deg(i), rad2deg(Omega), rad2deg(omega), rad2deg(nu));
endfunction
