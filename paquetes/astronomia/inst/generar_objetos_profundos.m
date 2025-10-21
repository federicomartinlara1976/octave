function generar_objetos_profundos()
% GENERAR_OBJETOS_PROFUNDOS Catálogo extendido de objetos Messier, NGC y otros
  
  printf('🔭 Generando catálogo extendido de objetos de cielo profundo...\n');
  
  % Estructura: catalogo, nombre, constelacion, tipo, ra, dec, magnitud, tamano, descripcion
  objetos = {
    % === NEBULOSAS ===
    'M42', 'Gran Nebulosa de Orión', 'Orion', 'Nebulosa de Emisión', 5.5883, -5.4500, 4.0, 65, 'Región de formación estelar visible a simple vista';
    'M57', 'Nebulosa del Anillo', 'Lyra', 'Nebulosa Planetaria', 18.8850, 33.0289, 8.8, 1, 'Restos de estrella similar al Sol';
    'M27', 'Nebulosa de la Manzana', 'Vulpecula', 'Nebulosa Planetaria', 19.9963, 22.7211, 7.4, 8, 'Una de las nebulosas planetarias más brillantes';
    'M8', 'Nebulosa de la Laguna', 'Sagittarius', 'Nebulosa de Emisión', 18.0337, -24.3833, 6.0, 90, 'Gran nube de gas y polvo con cúmulo estelar';
    'M20', 'Nebulosa de la Trífida', 'Sagittarius', 'Nebulosa de Emisión', 18.0227, -23.0797, 6.3, 28, 'Combinación de nebulosa de emisión y reflexión';
    'M17', 'Nebulosa Omega', 'Sagittarius', 'Nebulosa de Emisión', 18.2037, -16.1756, 6.0, 11, 'Región HII masiva en Sagitario';
    'M16', 'Nebulosa del Águila', 'Serpens', 'Nebulosa de Emisión', 18.1833, -13.8067, 6.4, 7, 'Famosa por los "Pilares de la Creación"';
    'M1', 'Nebulosa del Cangrejo', 'Taurus', 'Resto de Supernova', 5.5750, 22.0144, 8.4, 6, 'Restos de supernova observada en 1054';
    
    % === CÚMULOS GLOBULARES ===
    'M13', 'Gran Cúmulo de Hércules', 'Hercules', 'Cúmulo Globular', 16.6915, 36.4617, 5.8, 20, 'Uno de los cúmulos globulares más brillantes del norte';
    'M5', '', 'Serpens', 'Cúmulo Globular', 15.1817, 2.0811, 5.6, 23, 'Cúmulo globular antiguo y denso';
    'M22', '', 'Sagittarius', 'Cúmulo Globular', 18.3600, -23.9044, 5.1, 32, 'Uno de los cúmulos globulares más cercanos';
    'M4', '', 'Scorpius', 'Cúmulo Globular', 16.2333, -26.5256, 5.6, 26, 'Cúmulo globular cercano con barra central';
    'M15', '', 'Pegasus', 'Cúmulo Globular', 21.5000, 12.1667, 6.2, 18, 'Cúmulo denso con posible agujero negro central';
    
    % === CÚMULOS ABIERTOS ===
    'M45', 'Pléyades', 'Taurus', 'Cúmulo Abierto', 3.7917, 24.1050, 1.6, 110, 'Cúmulo joven visible a simple vista, "Siete Hermanas"';
    'M44', 'El Pesebre', 'Cancer', 'Cúmulo Abierto', 8.6667, 19.6667, 3.7, 95, 'Cúmulo abierto grande y brillante';
    'M7', 'Cúmulo de Ptolomeo', 'Scorpius', 'Cúmulo Abierto', 17.8967, -34.7922, 3.3, 80, 'Gran cúmulo abierto en cola de Escorpio';
    'M6', 'Cúmulo de la Mariposa', 'Scorpius', 'Cúmulo Abierto', 17.6700, -32.2000, 4.2, 25, 'Cúmulo con forma de mariposa';
    'M35', '', 'Gemini', 'Cúmulo Abierto', 6.0833, 24.3333, 5.1, 28, 'Rico cúmulo abierto cerca de los Gemelos';
    'M11', 'Cúmulo del Pato Salvaje', 'Scutum', 'Cúmulo Abierto', 18.8517, -6.2667, 5.8, 14, 'Uno de los cúmulos abiertos más ricos y compactos';
    
    % === GALAXIAS ===
    'M31', 'Galaxia de Andrómeda', 'Andromeda', 'Galaxia Espiral', 0.7129, 41.2692, 3.4, 190, 'Galaxia espiral más cercana, visible a simple vista';
    'M51', 'Galaxia del Remolino', 'Canes Venatici', 'Galaxia Espiral', 13.4983, 47.1950, 8.4, 11, 'Galaxia en interacción con compañera';
    'M104', 'Galaxia del Sombrero', 'Virgo', 'Galaxia Espiral', 12.6667, -11.6236, 8.0, 9, 'Famosa por su prominente bulbo y disco de polvo';
    'M81', 'Galaxia de Bode', 'Ursa Major', 'Galaxia Espiral', 9.9258, 69.0653, 6.9, 21, 'Gran galaxia espiral en Osa Mayor';
    'M82', 'Galaxia del Cigarro', 'Ursa Major', 'Galaxia Irregular', 9.9358, 69.6797, 8.4, 11, 'Galaxia con intensa formación estelar';
    'M101', 'Galaxia del Molinete', 'Ursa Major', 'Galaxia Espiral', 14.0533, 54.3489, 7.9, 22, 'Gran galaxia espiral face-on';
    'M87', '', 'Virgo', 'Galaxia Elíptica', 12.5133, 12.3911, 8.6, 7, 'Galaxia elíptica gigante con jet de agujero negro';
    'M64', 'Galaxia del Ojo Negro', 'Coma Berenices', 'Galaxia Espiral', 12.9367, 21.6828, 8.5, 9, 'Galaxia con banda de polvo oscuro prominente';
    
    % === OTROS OBJETOS NOTABLES ===
    'M3', '', 'Canes Venatici', 'Cúmulo Globular', 13.7000, 28.3833, 6.2, 16, 'Cúmulo globular muy rico en estrellas variables';
    'M33', 'Galaxia del Triángulo', 'Triangulum', 'Galaxia Espiral', 1.5333, 30.6592, 5.7, 62, 'Miembro del Grupo Local, difícil de observar';
    'M94', '', 'Canes Venatici', 'Galaxia Espiral', 12.8833, 41.1189, 8.2, 7, 'Galaxia con anillo de formación estelar';
    'M63', 'Galaxia del Girasol', 'Canes Venatici', 'Galaxia Espiral', 13.2625, 42.0292, 8.6, 10, 'Galaxia espiral con estructura filamentosa'
  };
  
  archivo_csv = 'datos/objetos_profundos.csv';
  fid = fopen(archivo_csv, 'w');
  
  fprintf(fid, 'catalogo,nombre,constelacion,tipo,ra,dec,magnitud,tamano,descripcion\n');
  
  for i = 1:size(objetos, 1)
    fprintf(fid, '%s,%s,%s,%s,%.4f,%.4f,%.1f,%d,%s\n', objetos{i,:});
  endfor
  
  fclose(fid);
  
  % Estadísticas por tipo
  tipos = objetos(:,4);
  tipos_unicos = unique(tipos);
  
  printf('✅ Catálogo de objetos profundos generado: %s\n', archivo_csv);
  printf('   %d objetos de cielo profundo registrados\n', size(objetos, 1));
  
  for i = 1:length(tipos_unicos)
    count = sum(strcmp(tipos, tipos_unicos{i}));
    printf('   • %s: %d objetos\n', tipos_unicos{i}, count);
  endfor
endfunction