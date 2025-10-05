function distancia = paralaje2distancia(paralaje)
    % paralaje en segundos de arco
    % distancia en parsecs
    distancia = 1 / paralaje;
    printf("Distancia: %.2f parsecs (%.2f años luz)\n", ...
           distancia, distancia * 3.262);
end

% Ejemplo: Paralaje de Alpha Centauri (0.75")
paralaje2distancia(0.75);