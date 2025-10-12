function estrellas = obtener_estrellas_brillantes()
% OBTENER_ESTRELLAS_BRILLANTES Catálogo de estrellas brillantes

  estrellas = struct();

  % Estrellas principales de Orion
  estrellas(1).nombre = 'Betelgeuse';
  estrellas(1).constelacion = 'Orion';
  estrellas(1).ra = 5.9196;
  estrellas(1).dec = 7.4071;
  estrellas(1).magnitud = 0.45;

  estrellas(2).nombre = 'Rigel';
  estrellas(2).constelacion = 'Orion';
  estrellas(2).ra = 5.2423;
  estrellas(2).dec = -8.2016;
  estrellas(2).magnitud = 0.18;

  estrellas(3).nombre = 'Bellatrix';
  estrellas(3).constelacion = 'Orion';
  estrellas(3).ra = 5.4188;
  estrellas(3).dec = 6.3497;
  estrellas(3).magnitud = 1.64;

  % Estrellas de Ursa Major
  estrellas(4).nombre = 'Dubhe';
  estrellas(4).constelacion = 'Ursa Major';
  estrellas(4).ra = 11.0621;
  estrellas(4).dec = 61.7510;
  estrellas(4).magnitud = 1.79;

  estrellas(5).nombre = 'Merak';
  estrellas(5).constelacion = 'Ursa Major';
  estrellas(5).ra = 11.0307;
  estrellas(5).dec = 56.3824;
  estrellas(5).magnitud = 2.37;

  % Estrellas de Cygnus
  estrellas(6).nombre = 'Deneb';
  estrellas(6).constelacion = 'Cygnus';
  estrellas(6).ra = 20.6905;
  estrellas(6).dec = 45.2800;
  estrellas(6).magnitud = 1.25;

  estrellas(7).nombre = 'Albireo';
  estrellas(7).constelacion = 'Cygnus';
  estrellas(7).ra = 19.5121;
  estrellas(7).dec = 27.9597;
  estrellas(7).magnitud = 3.05;
endfunction
