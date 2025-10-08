function [da_dt, de_dt, di_dt] = perturbaciones_simbolicas()
% PERTURBACIONES_SIMBOLICAS Ecuaciones de perturbaciones orbitales

    syms a e i Omega omega M n mu J2 R positive
    syms t

    % Perturbación J2 (achatamiento terrestre)
    da_dt = 0;  % Semieje mayor no cambia por J2

    de_dt = 0;  % Excentricidad no cambia por J2 (en promedio)

    % Tasa de cambio de inclinación
    di_dt = 0;

    % Tasa de cambio de longitud del nodo (precesión nodal)
    p = a*(1 - e^2);
    dOmega_dt = -3/2 * n * J2 * (R/p)^2 * cos(i);

    % Tasa de cambio del argumento del perihelio
    domega_dt = 3/2 * n * J2 * (R/p)^2 * (2 - 5/2*sin(i)^2);

    printf('Ecuaciones de perturbación J2:\n');
    printf('dΩ/dt = %s\n', char(dOmega_dt));
    printf('dω/dt = %s\n', char(domega_dt));
endfunction
