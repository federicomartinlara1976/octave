m=input('Introduce el número de filas: ');
n=input('Introduce el número de columnas: ');

for i=1:m
  for j=1:n
    A(i,j)=1/(i+j-1);
  end
end