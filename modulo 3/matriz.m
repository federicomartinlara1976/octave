A=input('Introduce una matriz: ');
while isempty(A)
  A=input('Debes introducir un dato. Introduce una matriz');
end

filas=size(A,1);
n=input('Introduce número de fila: ');

while n~=fix(n)|n>filas|n<1
  n=input('Dato Erróneo.Introduce número de fila');
end

v=A(n,:);
A(n,:)=[];
A=[A;v];
disp(A)