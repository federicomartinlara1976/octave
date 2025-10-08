function [precession_matrix] = precesion_equinoccios_simbolica(T)
% PRECESION_EQUINOCCIOS_SIMBOLICA Precesión de los equinoccios

    syms t years
    % T en años julianos desde J2000.0

    % Constantes de precesión (simplificadas)
    zeta = deg2rad(0.6406161 + 0.0000839*T + 0.0000050*T^2);
    theta = deg2rad(0.5567530 - 0.0001185*T - 0.0000116*T^2);
    z = deg2rad(0.6406161 + 0.0003041*T + 0.0000051*T^2);

    % Matriz de precesión
    precession_matrix = matriz_rotacion_simbolica(-z, 'z') * ...
                        matriz_rotacion_simbolica(theta, 'y') * ...
                        matriz_rotacion_simbolica(-zeta, 'z');

    printf('Matriz de precesión para T=%.1f años:\n', T);
endfunction
