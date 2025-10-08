function sistemas_referencia()
% SISTEMAS_REFERENCIA Módulo de sistemas de referencia
%   sistemas_referencia() - Muestra ayuda del módulo
  printf('Módulo de sistemas de referencia cargado\n');
  printf('Funciones: matriz_rotacion_simbolica, precesion_equinoccios_simbolica\n');
endfunction

function [rot_matrix, deriv_matrix] = matriz_rotacion_simbolica(angle, axis)
% MATRIZ_ROTACION_SIMBOLICA Matriz de rotación 3D simbólica

    syms t
    theta = sym(angle);

    switch axis
        case 'x'
            rot_matrix = [1, 0, 0;
                          0, cos(theta), -sin(theta);
                          0, sin(theta), cos(theta)];
        case 'y'
            rot_matrix = [cos(theta), 0, sin(theta);
                          0, 1, 0;
                          -sin(theta), 0, cos(theta)];
        case 'z'
            rot_matrix = [cos(theta), -sin(theta), 0;
                          sin(theta), cos(theta), 0;
                          0, 0, 1];
        otherwise
            error('Eje debe ser x, y o z');
    end

    % Derivada temporal (para velocidades angulares)
    deriv_matrix = diff(rot_matrix, t);

    printf('Matriz de rotación alrededor del eje %s:\n', axis);
    disp(rot_matrix);
endfunction

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
