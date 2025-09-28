cara=0; %número de caras
cruz=0; %número de cruces
nvec=0; %contador del número de tiradas

while cara-cruz~=5
  x=rand();
  nvec=nvec+1;
  
  if x<0.5
    cara=cara+1;
  else
    cruz=cruz+1;
  end
end

fprintf('Se ha conseguido en %d veces\n',nvec);