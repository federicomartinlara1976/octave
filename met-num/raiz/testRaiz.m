puntoInicial = -1;
a = -1;
aproximacionPrimera = 0;
b = 0;
tolerancia = 10^(-6);
iteraciones = 20;

[sol1, valorf1, ni1] = biseccion(a, b, tolerancia);
[x2, sol2, ni2, error2] = secante(puntoInicial, aproximacionPrimera, tolerancia, iteraciones);
[x3, sol3, ni3, error1] = newtonRaphson(puntoInicial, tolerancia, iteraciones);
