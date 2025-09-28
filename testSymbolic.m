pkg load symbolic

syms x;           % Define una variable simbólica
f = x^2 + sin(x); % Define la función
disp(f);          % Muestra la función
df = diff(f, x);  % Calcula la derivada
disp(df);         % Muestra el resultado
