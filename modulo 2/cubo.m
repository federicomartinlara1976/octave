L=input('Introduce el lado del cubo: ');
P=input('Introduce las coordenadas del punto: ');

if max(abs(P))<L/2
  disp('El punto es interior al cubo');
elseif max(abs(P))==L/2
  disp('El punto está en la frontera del cubo');
else
  disp('El punto es exterior al cubo');
end