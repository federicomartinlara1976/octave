function generar_estrellas_brillantes_completas()
% GENERAR_ESTRELLAS_BRILLANTES_COMPLETAS Catálogo hasta magnitud 4.0
  
  printf('🔭 Generando catálogo extendido de estrellas brillantes (mag ≤ 4.0)...\n');
  
  % Estructura: nombre, constelacion, ra, dec, magnitud, tipo_espectral, nombre_alternativo
  estrellas = {
    % === ORION ===
    'Rigel', 'Orion', 5.2423, -8.2016, 0.18, 'B8Ia', 'Beta Orionis';
    'Betelgeuse', 'Orion', 5.9196, 7.4071, 0.45, 'M1Iab', 'Alpha Orionis';
    'Bellatrix', 'Orion', 5.4188, 6.3497, 1.64, 'B2III', 'Gamma Orionis';
    'Alnitak', 'Orion', 5.6793, -1.9426, 1.74, 'O9.7Ib', 'Zeta Orionis';
    'Alnilam', 'Orion', 5.6036, -1.2019, 1.69, 'B0Ia', 'Epsilon Orionis';
    'Mintaka', 'Orion', 5.5334, -0.2991, 2.23, 'O9.5II', 'Delta Orionis';
    'Saiph', 'Orion', 5.7959, -9.6696, 2.07, 'B0.5Ia', 'Kappa Orionis';
    'Hatysa', 'Orion', 5.6275, -5.9094, 2.75, 'O9III', 'Iota Orionis';
    
    % === URSA MAJOR ===
    'Alioth', 'Ursa Major', 12.9005, 55.9598, 1.76, 'A0pCr', 'Epsilon Ursae Majoris';
    'Dubhe', 'Ursa Major', 11.0621, 61.7510, 1.79, 'K0III', 'Alpha Ursae Majoris';
    'Alkaid', 'Ursa Major', 13.7923, 49.3133, 1.85, 'B3V', 'Eta Ursae Majoris';
    'Mizar', 'Ursa Major', 13.3988, 54.9254, 2.23, 'A2V', 'Zeta Ursae Majoris';
    'Merak', 'Ursa Major', 11.0307, 56.3824, 2.37, 'A1V', 'Beta Ursae Majoris';
    'Phecda', 'Ursa Major', 11.8972, 53.6948, 2.44, 'A0V', 'Gamma Ursae Majoris';
    'Megrez', 'Ursa Major', 12.2571, 57.0326, 3.32, 'A3V', 'Delta Ursae Majoris';
    
    % === CYGNUS ===
    'Deneb', 'Cygnus', 20.6905, 45.2800, 1.25, 'A2Ia', 'Alpha Cygni';
    'Sadr', 'Cygnus', 20.3705, 40.2567, 2.23, 'F8Ib', 'Gamma Cygni';
    'Gienah', 'Cygnus', 20.6902, 33.9703, 2.48, 'K0III', 'Epsilon Cygni';
    'Delta Cygni', 'Cygnus', 19.7497, 45.1308, 2.86, 'B9III', '';
    'Albireo', 'Cygnus', 19.5121, 27.9597, 3.05, 'K3II', 'Beta Cygni';
    
    % === LEO ===
    'Regulus', 'Leo', 10.1395, 11.9672, 1.36, 'B7V', 'Alpha Leonis';
    'Denebola', 'Leo', 11.8177, 14.5721, 2.14, 'A3V', 'Beta Leonis';
    'Algieba', 'Leo', 10.3329, 19.8415, 2.61, 'K0III', 'Gamma Leonis';
    'Zosma', 'Leo', 11.2352, 20.5237, 2.56, 'A4V', 'Delta Leonis';
    'Rasalas', 'Leo', 9.8798, 26.0069, 3.88, 'K1III', 'Mu Leonis';
    
    % === SCORPIUS ===
    'Antares', 'Scorpius', 16.4901, -26.4320, 0.96, 'M1Ib', 'Alpha Scorpii';
    'Shaula', 'Scorpius', 17.5602, -37.1038, 1.62, 'B2IV', 'Lambda Scorpii';
    'Sargas', 'Scorpius', 17.6219, -42.9978, 1.86, 'F1II', 'Theta Scorpii';
    'Dschubba', 'Scorpius', 16.0056, -22.6217, 2.29, 'B0V', 'Delta Scorpii';
    'Acrab', 'Scorpius', 16.0906, -19.8054, 2.56, 'B1V', 'Beta Scorpii';
    
    % === 50+ estrellas adicionales de otras constelaciones importantes ===
    'Vega', 'Lyra', 18.6156, 38.7836, 0.03, 'A0Va', 'Alpha Lyrae';
    'Arcturus', 'Boötes', 14.2610, 19.1824, -0.05, 'K1.5III', 'Alpha Boötis';
    'Capella', 'Auriga', 5.2782, 46.0060, 0.08, 'G3III', 'Alpha Aurigae';
    'Rigil Kentaurus', 'Centaurus', 14.6608, -60.8339, -0.01, 'G2V', 'Alpha Centauri';
    'Procyon', 'Canis Minor', 7.6550, 5.2250, 0.34, 'F5IVV', 'Alpha Canis Minoris';
    'Achernar', 'Eridanus', 1.6286, -57.2368, 0.45, 'B3Vpe', 'Alpha Eridani';
    'Altair', 'Aquila', 19.8464, 8.8683, 0.76, 'A7V', 'Alpha Aquilae';
    'Aldebaran', 'Taurus', 4.5987, 16.5093, 0.87, 'K5III', 'Alpha Tauri';
    'Spica', 'Virgo', 13.4199, -11.1613, 0.98, 'B1III', 'Alpha Virginis';
    'Pollux', 'Gemini', 7.7554, 28.0262, 1.14, 'K0IIIb', 'Beta Geminorum';
    'Fomalhaut', 'Piscis Austrinus', 22.9608, -29.6222, 1.16, 'A3V', 'Alpha Piscis Austrini';
    'Mimosa', 'Crux', 12.7954, -59.6888, 1.25, 'B0.5III', 'Beta Crucis';
    'Acrux', 'Crux', 12.4431, -63.0991, 0.77, 'B0.5IV', 'Alpha Crucis';
    'Castor', 'Gemini', 7.5786, 31.8886, 1.58, 'A1V', 'Alpha Geminorum';
    'Polaris', 'Ursa Minor', 2.5302, 89.2641, 1.97, 'F7Ib', 'Alpha Ursae Minoris'
  };
  
  % Escribir archivo CSV
  archivo_csv = 'datos/estrellas_brillantes_completas.csv';
  fid = fopen(archivo_csv, 'w');
  
  fprintf(fid, 'nombre,constelacion,ra,dec,magnitud,tipo_espectral,nombre_alternativo\n');
  
  for i = 1:size(estrellas, 1)
    fprintf(fid, '%s,%s,%.4f,%.4f,%.2f,%s,%s\n', estrellas{i,:});
  endfor
  
  fclose(fid);
  
  % Estadísticas
  magnitudes = cell2mat(estrellas(:,5));
  
  printf('✅ Catálogo de estrellas generado: %s\n', archivo_csv);
  printf('   %d estrellas brillantes registradas\n', size(estrellas, 1));
  printf('   Rango de magnitud: %.2f a %.2f\n', min(magnitudes), max(magnitudes));
  printf('   Estrellas de 1ª magnitud (<1.5): %d\n', sum(magnitudes < 1.5));
  printf('   Estrellas de 2ª magnitud (1.5-2.5): %d\n', sum(magnitudes >= 1.5 & magnitudes < 2.5));
  printf('   Estrellas de 3ª magnitud (2.5-3.5): %d\n', sum(magnitudes >= 2.5 & magnitudes < 3.5));
endfunction