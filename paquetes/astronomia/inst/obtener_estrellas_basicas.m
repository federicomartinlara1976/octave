function estrellas = obtener_estrellas_basicas()
% OBTENER_ESTRELLAS_BASICAS Estrellas principales en memoria
  
  estrellas = struct();
  
  estrellas_basicas = {
    'Rigel', 'Orion', 5.2423, -8.2016, 0.18, 'B8Ia', 'Beta Orionis';
    'Betelgeuse', 'Orion', 5.9196, 7.4071, 0.45, 'M1Iab', 'Alpha Orionis';
    'Bellatrix', 'Orion', 5.4188, 6.3497, 1.64, 'B2III', 'Gamma Orionis';
    'Sirius', 'Canis Major', 6.7525, -16.7161, -1.46, 'A1V', 'Alpha Canis Majoris';
    'Canopus', 'Carina', 6.3992, -52.6956, -0.74, 'F0Ib', 'Alpha Carinae';
    'Vega', 'Lyra', 18.6156, 38.7836, 0.03, 'A0Va', 'Alpha Lyrae';
    'Arcturus', 'Boötes', 14.2610, 19.1824, -0.05, 'K1.5III', 'Alpha Boötis';
    'Capella', 'Auriga', 5.2782, 46.0060, 0.08, 'G3III', 'Alpha Aurigae';
    'Procyon', 'Canis Minor', 7.6550, 5.2250, 0.34, 'F5IVV', 'Alpha Canis Minoris';
    'Altair', 'Aquila', 19.8464, 8.8683, 0.76, 'A7V', 'Alpha Aquilae'
  };
  
  for i = 1:size(estrellas_basicas, 1)
    estrellas(i).nombre = estrellas_basicas{i,1};
    estrellas(i).constelacion = estrellas_basicas{i,2};
    estrellas(i).ra = estrellas_basicas{i,3};
    estrellas(i).dec = estrellas_basicas{i,4};
    estrellas(i).magnitud = estrellas_basicas{i,5};
    estrellas(i).tipo_espectral = estrellas_basicas{i,6};
    estrellas(i).nombre_alternativo = estrellas_basicas{i,7};
  endfor
endfunction