puntoInicial = 2.5;
aproximacionPrimera = 2.6;
tolerancia = 0.0001;
iteraciones = 10;

[x1, sol1, ni1, error1] = newtonRaphson(puntoInicial, tolerancia, iteraciones);
[x2, sol2, ni2, error2] = secante(puntoInicial, aproximacionPrimera, tolerancia, iteraciones);
