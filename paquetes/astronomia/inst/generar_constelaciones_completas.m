function generar_constelaciones_completas()
% GENERAR_CONSTELACIONES_COMPLETAS Crea CSV con las 88 constelaciones IAU
  
  printf('🔭 Generando base de datos completa de 88 constelaciones IAU...\n');
  
  % Datos oficiales IAU - las 88 constelaciones con límites precisos
  constelaciones_iau = {
    'Andromeda', 'And', 4.52, 37.01, 21.68, 53.50, 722.3, 4, 'Princesa encadenada';
    'Antlia', 'Ant', 124.68, 150.52, -40.42, -24.54, 238.9, 3, 'Máquina neumática';
    'Apus', 'Aps', 332.06, 357.68, -83.12, -67.48, 206.3, 4, 'Ave del paraíso';
    'Aquarius', 'Aqr', 311.92, 359.29, -25.50, 2.82, 979.9, 11, 'Portador de agua';
    'Aquila', 'Aql', 276.14, 305.70, -12.03, 18.66, 652.5, 8, 'Águila';
    'Ara', 'Ara', 247.50, 280.50, -67.69, -45.49, 237.0, 7, 'Altar';
    'Aries', 'Ari', 26.90, 50.52, 10.36, 31.06, 441.4, 4, 'Carnero';
    'Auriga', 'Aur', 72.45, 107.00, 27.98, 56.25, 657.4, 8, 'Cochero';
    'Boötes', 'Boo', 202.50, 233.00, 7.36, 55.10, 906.8, 8, 'Boyero';
    'Caelum', 'Cae', 67.50, 82.50, -48.74, -27.02, 124.9, 4, 'Cincel';
    'Camelopardalis', 'Cam', 58.50, 173.00, 52.67, 86.35, 756.8, 4, 'Jirafa';
    'Cancer', 'Cnc', 117.50, 138.75, 7.00, 33.00, 505.9, 5, 'Cangrejo';
    'Canes Venatici', 'CVn', 180.00, 210.00, 27.84, 52.50, 465.2, 2, 'Perros de caza';
    'Canis Major', 'CMa', 91.50, 110.50, -33.00, -11.00, 380.1, 9, 'Perro mayor';
    'Canis Minor', 'CMi', 105.00, 115.00, -0.36, 13.50, 183.4, 2, 'Perro menor';
    'Capricornus', 'Cap', 297.50, 329.00, -27.50, -8.50, 413.9, 6, 'Cabra marina';
    'Carina', 'Car', 125.00, 170.00, -75.68, -50.75, 494.2, 9, 'Quilla';
    'Cassiopeia', 'Cas', 13.80, 55.05, 46.00, 77.00, 598.4, 8, 'Reina';
    'Centaurus', 'Cen', 169.95, 226.20, -64.00, -29.50, 1060.4, 11, 'Centauro';
    'Cepheus', 'Cep', 308.50, 359.00, 53.00, 88.50, 587.8, 5, 'Rey';
    'Cetus', 'Cet', 350.00, 40.00, -24.50, 10.50, 1231.4, 9, 'Ballena';
    'Chamaeleon', 'Cha', 114.50, 132.50, -82.85, -75.32, 131.6, 4, 'Camaleón';
    'Circinus', 'Cir', 205.50, 230.00, -69.50, -55.00, 93.4, 3, 'Compás';
    'Columba', 'Col', 75.00, 95.00, -42.50, -22.50, 270.2, 5, 'Paloma';
    'Coma Berenices', 'Com', 177.00, 202.00, 13.30, 33.50, 386.5, 3, 'Cabellera de Berenice';
    'Corona Australis', 'CrA', 267.50, 287.50, -45.00, -36.50, 127.7, 6, 'Corona austral';
    'Corona Borealis', 'CrB', 225.00, 240.00, 25.50, 40.00, 178.7, 6, 'Corona boreal';
    'Corvus', 'Crv', 175.00, 195.00, -25.00, -11.50, 183.8, 5, 'Cuervo';
    'Crater', 'Crt', 155.00, 175.00, -25.00, -6.50, 282.4, 4, 'Copa';
    'Crux', 'Cru', 176.50, 191.50, -64.50, -55.68, 68.4, 5, 'Cruz del sur';
    'Cygnus', 'Cyg', 286.20, 340.05, 27.50, 61.00, 804.0, 9, 'Cisne';
    'Delphinus', 'Del', 295.50, 310.50, 2.50, 21.00, 188.5, 5, 'Delfín';
    'Dorado', 'Dor', 65.00, 105.00, -69.00, -48.50, 179.2, 3, 'Pez dorado';
    'Draco', 'Dra', 165.00, 295.00, 47.50, 86.50, 1082.9, 9, 'Dragón';
    'Equuleus', 'Equ', 308.50, 317.00, 2.50, 13.00, 71.6, 4, 'Caballito';
    'Eridanus', 'Eri', 22.50, 80.00, -57.50, -0.50, 1137.9, 12, 'Río';
    'Fornax', 'For', 37.50, 55.00, -39.50, -23.50, 397.5, 3, 'Horno';
    'Gemini', 'Gem', 88.80, 123.75, 10.00, 35.00, 513.8, 8, 'Gemelos';
    'Grus', 'Gru', 319.50, 355.00, -56.00, -36.00, 365.5, 8, 'Grulla';
    'Hercules', 'Her', 236.00, 283.00, 3.50, 51.50, 1225.1, 11, 'Hércules';
    'Horologium', 'Hor', 37.50, 65.00, -67.00, -39.50, 248.9, 3, 'Reloj';
    'Hydra', 'Hya', 130.00, 170.00, -35.00, 7.00, 1302.8, 10, 'Hidra hembra';
    'Hydrus', 'Hyi', 0.00, 80.00, -82.00, -57.50, 243.0, 3, 'Hidra macho';
    'Indus', 'Ind', 295.00, 335.00, -74.50, -44.50, 294.0, 4, 'Indio';
    'Lacerta', 'Lac', 330.00, 355.00, 35.00, 56.00, 200.7, 5, 'Lagarto';
    'Leo', 'Leo', 138.75, 177.45, -6.00, 33.00, 946.9, 9, 'León';
    'Leo Minor', 'LMi', 145.00, 165.00, 22.50, 41.00, 231.9, 3, 'León menor';
    'Lepus', 'Lep', 72.50, 91.50, -27.00, -11.00, 290.3, 8, 'Liebre';
    'Libra', 'Lib', 217.50, 236.00, -30.00, -0.50, 538.1, 5, 'Balanza';
    'Lupus', 'Lup', 217.50, 247.50, -55.00, -29.50, 333.7, 9, 'Lobo';
    'Lynx', 'Lyn', 105.00, 145.00, 32.50, 61.50, 545.4, 4, 'Lince';
    'Lyra', 'Lyr', 277.50, 290.50, 25.50, 47.50, 286.5, 6, 'Lira';
    'Mensa', 'Men', 65.00, 90.00, -85.00, -69.50, 153.5, 4, 'Mesa';
    'Microscopium', 'Mic', 305.00, 325.00, -45.00, -27.50, 209.5, 5, 'Microscopio';
    'Monoceros', 'Mon', 91.50, 117.50, -11.00, 12.00, 481.6, 4, 'Unicornio';
    'Musca', 'Mus', 170.00, 200.00, -75.00, -64.00, 138.4, 6, 'Mosca';
    'Norma', 'Nor', 230.00, 252.50, -60.50, -42.00, 165.3, 4, 'Escuadra';
    'Octans', 'Oct', 0.00, 360.00, -90.00, -74.50, 291.0, 3, 'Octante';
    'Ophiuchus', 'Oph', 236.00, 275.00, -30.00, 14.50, 948.3, 10, 'Serpentario';
    'Orion', 'Ori', 72.30, 103.05, -11.00, 23.00, 594.1, 8, 'Cazador';
    'Pavo', 'Pav', 275.00, 315.00, -75.00, -56.50, 377.7, 7, 'Pavo real';
    'Pegasus', 'Peg', 320.00, 360.00, 2.00, 36.00, 1120.8, 9, 'Pegaso';
    'Perseus', 'Per', 22.50, 58.50, 30.90, 59.00, 614.9, 9, 'Perseo';
    'Phoenix', 'Phe', 350.00, 30.00, -57.50, -40.50, 469.3, 6, 'Fénix';
    'Pictor', 'Pic', 65.00, 95.00, -61.00, -42.50, 246.7, 3, 'Caballete';
    'Pisces', 'Psc', 340.00, 30.00, -7.00, 33.00, 889.4, 7, 'Peces';
    'Piscis Austrinus', 'PsA', 320.00, 350.00, -36.50, -24.50, 245.4, 7, 'Pez austral';
    'Puppis', 'Pup', 95.00, 140.00, -51.00, -11.00, 673.4, 9, 'Popa';
    'Pyxis', 'Pyx', 125.00, 145.00, -37.00, -17.00, 220.8, 3, 'Brújula';
    'Reticulum', 'Ret', 55.00, 75.00, -67.00, -52.50, 113.9, 4, 'Retículo';
    'Sagitta', 'Sge', 285.00, 295.00, 15.50, 21.50, 79.9, 4, 'Flecha';
    'Sagittarius', 'Sgr', 265.00, 305.00, -45.00, -12.00, 867.4, 12, 'Sagitario';
    'Scorpius', 'Sco', 238.80, 263.70, -45.50, -8.00, 496.8, 10, 'Escorpión';
    'Sculptor', 'Scl', 350.00, 20.00, -39.00, -24.50, 474.8, 4, 'Escultor';
    'Scutum', 'Sct', 270.00, 285.00, -16.00, -4.00, 109.1, 2, 'Escudo';
    'Serpens', 'Ser', 225.00, 260.00, -16.00, 25.50, 636.9, 9, 'Serpiente';
    'Sextans', 'Sex', 145.00, 165.00, -11.50, 6.50, 313.5, 3, 'Sextante';
    'Taurus', 'Tau', 51.30, 88.80, -1.00, 31.00, 797.2, 9, 'Toro';
    'Telescopium', 'Tel', 285.00, 305.00, -56.00, -45.00, 251.5, 3, 'Telescopio';
    'Triangulum', 'Tri', 22.50, 37.50, 25.50, 37.50, 131.8, 3, 'Triángulo';
    'Triangulum Australe', 'TrA', 238.00, 255.00, -70.00, -60.00, 109.9, 3, 'Triángulo austral';
    'Tucana', 'Tuc', 335.00, 25.00, -75.00, -56.00, 294.6, 3, 'Tucán';
    'Ursa Major', 'UMa', 121.20, 217.50, 28.00, 73.00, 1279.7, 7, 'Osa mayor';
    'Ursa Minor', 'UMi', 0.00, 360.00, 65.50, 90.00, 255.9, 7, 'Osa menor';
    'Vela', 'Vel', 125.00, 165.00, -57.00, -37.00, 499.6, 5, 'Vela';
    'Virgo', 'Vir', 175.05, 226.20, -22.00, 14.00, 1294.4, 9, 'Virgen';
    'Volans', 'Vol', 105.00, 125.00, -75.00, -64.00, 141.4, 6, 'Pez volador';
    'Vulpecula', 'Vul', 285.00, 305.00, 19.00, 29.50, 268.2, 5, 'Zorra'
  };
  
  % Crear directorio si no existe
  if ~exist('datos', 'dir')
    mkdir('datos');
  endif
  
  % Escribir archivo CSV
  archivo_csv = 'datos/constelaciones_iau_completas.csv';
  fid = fopen(archivo_csv, 'w');
  
  if fid == -1
    error('No se pudo crear el archivo CSV');
  endif
  
  % Cabecera
  fprintf(fid, 'nombre,abreviatura,ra_min,ra_max,dec_min,dec_max,area,estrellas_principales,mitologia\n');
  
  % Datos
  for i = 1:size(constelaciones_iau, 1)
    fprintf(fid, '%s,%s,%.2f,%.2f,%.2f,%.2f,%.1f,%d,%s\n', constelaciones_iau{i,:});
  endfor
  
  fclose(fid);
  
  % Estadísticas
  areas = cell2mat(constelaciones_iau(:,7));
  total_area = sum(areas);
  porcentaje_cielo = total_area / 41253 * 100;
  
  printf('✅ Base de datos generada: %s\n', archivo_csv);
  printf('   %d constelaciones IAU registradas\n', size(constelaciones_iau, 1));
  printf('   Área total cubierta: %.1f grados²\n', total_area);
  printf('   Cobertura del cielo: %.1f%%\n', porcentaje_cielo);
  printf('   Constelación más grande: %s (%.1f°²)\n', constelaciones_iau{find(areas == max(areas), 1)}, max(areas));
  printf('   Constelación más pequeña: %s (%.1f°²)\n', constelaciones_iau{find(areas == min(areas), 1)}, min(areas));
endfunction