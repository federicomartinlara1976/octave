coef=input('Introduce los coeficientes de la ecuación: ');
x0=input('Introduce posible raíz ');

comp=coef(1)*x0^2+coef(2)*x0+coef(3)==0;

if comp
  respuesta='es raíz';
else
  respuesta='no es raíz';
end

fprintf('RESULTADO DE LA COMPROBACIÓN: %s\n',respuesta);