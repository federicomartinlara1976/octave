function info = obtener_info_constelaciones()
% OBTENER_INFO_CONSTELACIONES Información detallada

  info = struct();

  info(1).nombre = 'Orion';
  info(1).nombre_es = 'Orión';
  info(1).abreviatura = 'Ori';
  info(1).genitivo = 'Orionis';
  info(1).area = 594;
  info(1).ra_min = 4.82 * 15; info(1).ra_max = 6.87 * 15;
  info(1).dec_min = -11.0; info(1).dec_max = 23.0;
  info(1).estrellas_principales = 7;
  info(1).mitologia = 'Cazador de la mitología griega';
  info(1).mejor_visible = 'Enero - Marzo (invierno boreal)';

  info(2).nombre = 'Ursa Major';
  info(2).nombre_es = 'Osa Mayor';
  info(2).abreviatura = 'UMa';
  info(2).genitivo = 'Ursae Majoris';
  info(2).area = 1280;
  info(2).ra_min = 8.08 * 15; info(2).ra_max = 14.50 * 15;
  info(2).dec_min = 28.0; info(2).dec_max = 73.0;
  info(2).estrellas_principales = 7;
  info(2).mitologia = 'Osa de la mitología griega (Calisto)';
  info(2).mejor_visible = 'Abril - Junio (primavera boreal)';
endfunction
