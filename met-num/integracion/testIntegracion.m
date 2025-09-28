a = 1.0;
b = 4.0;
tolerancia = 0.0001;
iteraciones = 12;

tic1 = tic();
[valor, int, error] = integracion(a,b,tolerancia,iteraciones);
elapsed_1 = toc(tic1);

fprintf("Integracion: %d\n", elapsed_1);