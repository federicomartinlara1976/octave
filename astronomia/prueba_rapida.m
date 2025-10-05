% --- PRUEBA RÁPIDA ---
% Copia y pega esto en Octave para probar

% Configura tu ubicación
mi_latitud = 40.4;   % Madrid
mi_longitud = -3.7;

% Prueba coordenadas
altura = 45; azimut = 180;
[ha, dec] = altaz2hadec(altura, azimut, mi_latitud);
printf("Objeto a Alt=%.0f°, Az=%.0f°:\n", altura, azimut);
printf(" - Ángulo Horario: %.2f°\n", ha);
printf(" - Declinación: %.2f°\n", dec);

% Prueba tiempo sidéreo
fecha_actual = now();
lst = calcular_lst(fecha_actual, mi_longitud);
printf("\nTiempo Sidéreo Local: %.4f horas\n", lst);

% Conversión a coordenadas ecuatoriales
[ra, dec_final] = hadec2radec(ha, dec, lst);
hms = deg2hms(ra * 15);
printf("Coordenadas Ecuatoriales:\n");
printf(" - RA: %02.0fh %02.0fm %04.1fs\n", hms(1), hms(2), hms(3));
printf(" - Dec: %+.2f°\n", dec_final);