function count = contar_estrellas_brillantes(constelacion, mag_limite)
% CONTAR_ESTRELLAS_BRILLANTES Cuenta estrellas brillantes

  estrellas = obtener_estrellas_brillantes();
  mascara = strcmp({estrellas.constelacion}, constelacion) & ...
            [estrellas.magnitud] <= mag_limite;
  count = sum(mascara);
endfunction
