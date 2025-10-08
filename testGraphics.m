% Datos de ejemplo
x = 0:0.1:2*pi;
y = sin(x);
z = 0:0.5:2*pi;
pz = cos(z);

% Gráfico corregido
figure;
hold on;
plot(x, y, '-b', 'LineWidth', 2);    % Línea azul continua
plot(z, pz, 'or', 'MarkerSize', 8);  % Círculos rojos
hold off;
grid on;
title('Gráfico corregido en Octave');
xlabel('X');
ylabel('Y');
legend('sin(x)', 'cos(z)');
