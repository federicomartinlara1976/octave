lados=input('Introduce el tamaño de los tres lados del triángulo: ');

lados=sort(lados);
a=lados(1);b=lados(2); %catetos
c=lados(3); %hipotenusa

if a^2+b^2==c^2
  disp('El triángulo es rectángulo');
else
  disp('El triángulo no es rectángulo');
end