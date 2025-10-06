function [fase, porcentaje_iluminacion] = fase_lunar_aproximada(dias_desde_luna_nueva)
    % dias_desde_luna_nueva: días desde última luna nueva
    angulo = mod(dias_desde_luna_nueva, 29.53) / 29.53 * 360;
    iluminacion = (1 - cos(deg2rad(angulo))) / 2;
    porcentaje_iluminacion = iluminacion * 100;
    
    if angulo < 90
        fase = "Luna creciente";
    elseif angulo < 180
        fase = "Luna llena";
    elseif angulo < 270
        fase = "Luna menguante";
    else
        fase = "Luna nueva";
    end
end