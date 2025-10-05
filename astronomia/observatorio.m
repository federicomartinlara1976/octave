% --- OBSERVATORIO VIRTUAL ---
% Funciones astronómicas básicas
% Creado por Federico Martín Lara

function observatorio()
    printf("=== OBSERVATORIO VIRTUAL ===\n");
    printf("1. Conversión de coordenadas\n");
    printf("2. Tiempo sidéreo\n");
    printf("3. Fases lunares\n");
    printf("4. Calculadora orbital\n");
    printf("5. Salir\n");
    
    opcion = input("Elige una opción: ");
    
    switch opcion
        case 1
            menu_coordenadas();
        case 2
            menu_tiempo_sidereo();
        case 3
            menu_fases_lunares();
        case 4
            menu_orbital();
        otherwise
            printf("¡Hasta pronto!\n");
    end
end