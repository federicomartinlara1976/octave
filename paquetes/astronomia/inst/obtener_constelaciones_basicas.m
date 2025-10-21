function datos = obtener_constelaciones_basicas()
% OBTENER_CONSTELACIONES_BASICAS Datos mínimos en memoria (fallback)
  
  printf('   Usando datos básicos en memoria...\n');
  
  datos = struct();
  
  % 20 constelaciones principales para fallback
  constelaciones_basicas = {
    'Ursa Major', 'UMa', 121.2, 217.5, 28.0, 73.0, 1280.0, 7, 'Osa mayor';
    'Orion', 'Ori', 72.3, 103.05, -11.0, 23.0, 594.0, 8, 'Cazador';
    'Cassiopeia', 'Cas', 13.8, 55.05, 46.0, 77.0, 598.0, 8, 'Reina';
    'Cygnus', 'Cyg', 286.2, 340.05, 27.5, 61.0, 804.0, 9, 'Cisne';
    'Leo', 'Leo', 138.75, 177.45, -6.0, 33.0, 947.0, 9, 'León';
    'Scorpius', 'Sco', 238.8, 263.7, -45.5, -8.0, 497.0, 10, 'Escorpión';
    'Taurus', 'Tau', 51.3, 88.8, -1.0, 31.0, 797.0, 9, 'Toro';
    'Virgo', 'Vir', 175.05, 226.2, -22.0, 14.0, 1294.0, 9, 'Virgen';
    'Centaurus', 'Cen', 169.95, 226.2, -64.0, -29.5, 1060.0, 11, 'Centauro';
    'Aquila', 'Aql', 280.05, 312.45, -12.0, 19.0, 652.0, 8, 'Águila';
    'Gemini', 'Gem', 88.8, 123.75, 10.0, 35.0, 514.0, 8, 'Gemelos';
    'Pegasus', 'Peg', 320.0, 360.0, 2.0, 36.0, 1121.0, 9, 'Pegaso';
    'Sagittarius', 'Sgr', 265.0, 305.0, -45.0, -12.0, 867.0, 12, 'Sagitario';
    'Boötes', 'Boo', 202.5, 233.0, 7.36, 55.1, 907.0, 8, 'Boyero';
    'Lyra', 'Lyr', 277.5, 290.5, 25.5, 47.5, 286.0, 6, 'Lira';
    'Hercules', 'Her', 236.0, 283.0, 3.5, 51.5, 1225.0, 11, 'Hércules';
    'Perseus', 'Per', 22.5, 58.5, 30.9, 59.0, 615.0, 9, 'Perseo';
    'Andromeda', 'And', 4.52, 37.01, 21.68, 53.5, 722.0, 4, 'Princesa';
    'Canis Major', 'CMa', 91.5, 110.5, -33.0, -11.0, 380.0, 9, 'Perro mayor';
    'Auriga', 'Aur', 72.45, 107.0, 27.98, 56.25, 657.0, 8, 'Cochero'
  };
  
  for i = 1:size(constelaciones_basicas, 1)
    datos(i).nombre = constelaciones_basicas{i,1};
    datos(i).abreviatura = constelaciones_basicas{i,2};
    datos(i).ra_min = constelaciones_basicas{i,3};
    datos(i).ra_max = constelaciones_basicas{i,4};
    datos(i).dec_min = constelaciones_basicas{i,5};
    datos(i).dec_max = constelaciones_basicas{i,6};
    datos(i).area = constelaciones_basicas{i,7};
    datos(i).estrellas_principales = constelaciones_basicas{i,8};
    datos(i).mitologia = constelaciones_basicas{i,9};
  endfor
  
  printf('   ✓ %d constelaciones básicas cargadas\n', length(datos));
endfunction