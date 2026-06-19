a = 1.0;
b = 4.0;
tolerancia = 0.0001;
h = 1.0;
iteraciones = 12;

[valor, int, error] = integracion(a,b,tolerancia,iteraciones);

fprintf("Integracion: %f\n", valor);

valor = simpson(a,b,iteraciones,h);

fprintf("Integracion: %f\n", valor);