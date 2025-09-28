v=input('introduce vector');
n=length(v);

for i=1:fix(n/2)
  aux=v(i);
  v(i)=v(n-i+1);
  v(n-i+1)=aux;
end

disp(v);