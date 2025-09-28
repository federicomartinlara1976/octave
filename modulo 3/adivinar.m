x=round(0.5+10*rand());
n=input('Introduce un numero entre 1 y 10: ');
intentos=1;

while(x~=n)n=input('No has acertado.Introduce otro numero entre 1 y 10: ');
  intentos=intentos+1;
end

fprintf('El numero es %d. Lo has adivinado en %d intentos\n',x,intentos);