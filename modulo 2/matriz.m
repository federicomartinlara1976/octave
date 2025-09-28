A=input('Introduce una matriz: ');
B=[ [A,sum(A')'] ; [sum(A),sum(sum(A))] ];
disp('La matriz resultado es: ');
disp(B);