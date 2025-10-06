% --- demo_utilidades.m ---
% Demo de funciones de utilidad

function demo_utilidades()
% DEMO_UTILIDADES Demostración de utilidades
    % Para una órbita terrestre (a=1 UA)
    printf('\n--- DEMO UTILIDADES ---\n');
    
    periodo_tierra = kepler_period3(1);
    printf("Periodo orbital Tierra: %.2f años\n", periodo_tierra);
    
    vel_tierra = orbital_velocity(1);
    printf("Velocidad orbital Tierra: %.2f km/s\n", vel_tierra);
endfunction 
