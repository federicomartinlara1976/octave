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
