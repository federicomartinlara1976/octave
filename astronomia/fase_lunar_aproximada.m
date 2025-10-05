function fase = fase_lunar_aproximada(dias_desde_luna_nueva)
    % dias_desde_luna_nueva: días desde última luna nueva
    angulo = mod(dias_desde_luna_nueva, 29.53) / 29.53 * 360;
    iluminacion = (1 - cos(deg2rad(angulo))) / 2;
    printf("Luna %.1f%% iluminada\n", iluminacion * 100);
    
    if angulo < 90
        printf("Luna creciente\n");
    elseif angulo < 180
        printf("Luna llena\n");
    elseif angulo < 270
        printf("Luna menguante\n");
    else
        printf("Luna nueva\n");
    end
end

% Ejemplo: 15 días después de luna nueva
fase_lunar_aproximada(15);