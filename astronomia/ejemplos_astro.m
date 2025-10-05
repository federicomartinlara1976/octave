function ejemplos_astro()
    printf("\n=== EJEMPLOS PRÁCTICOS ===\n");
    
    % Ejemplo 1: Estrella en el cenit de Madrid
    printf("\n1. Estrella en el cenit de Madrid:\n");
    alt = 90; az = 0; lat_madrid = 40.4; lon_madrid = -3.7;
    fecha = now();  % Fecha y hora actual
    
    lst = calcular_lst(fecha, lon_madrid);
    [ha, dec] = altaz2hadec(alt, az, lat_madrid);
    [ra, dec_final] = hadec2radec(ha, dec, lst);
    
    hms = deg2hms(ra * 15);  % Convertir RA a HMS
    printf("Coordenadas: RA = %02.0fh %02.0fm %04.1fs, Dec = %+.2f°\n", ...
           hms(1), hms(2), hms(3), dec_final);
    
    % Ejemplo 2: Posición de un planeta (simplificado)
    printf("\n2. Posición planetaria simplificada:\n");
    calcular_posicion_planetaria();
    
    % Ejemplo 3: Magnitud estelar
    printf("\n3. Magnitud estelar:\n");
    m1 = 2.0;  % Magnitud Vega
    m2 = 1.0;  % Magnitud Sirio
    ratio = magnitud2brillo(m1, m2);
    printf("Sirio es %.1f veces más brillante que Vega\n", ratio);
end

function calcular_posicion_planetaria()
    % Posición orbital simplificada (círculo)
    planeta = "Júpiter";
    periodo = 11.86;  % años
    distancia = 5.2;  % UA
    
    % Posición angular aproximada
    tiempo = mod(now(), periodo * 365) / (periodo * 365) * 360;
    printf("%s: longitud eclíptica ≈ %.1f°, distancia ≈ %.1f UA\n", ...
           planeta, tiempo, distancia);
end

function ratio = magnitud2brillo(m1, m2)
    % Diferencia de brillo entre dos magnitudes
    ratio = 2.512 ^ (m2 - m1);
end