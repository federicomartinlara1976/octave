function datos = obtener_limites_constelaciones()
% OBTENER_LIMITES_CONSTELACIONES Límites de constelaciones (IAU 1930)

  datos = struct();

  % 10 constelaciones principales para empezar
  datos(1).nombre = 'Ursa Major';
  datos(1).ra_min = 8.08 * 15; datos(1).ra_max = 14.50 * 15;
  datos(1).dec_min = 28.0; datos(1).dec_max = 73.0;

  datos(2).nombre = 'Orion';
  datos(2).ra_min = 4.82 * 15; datos(2).ra_max = 6.87 * 15;
  datos(2).dec_min = -11.0; datos(2).dec_max = 23.0;

  datos(3).nombre = 'Cassiopeia';
  datos(3).ra_min = 0.92 * 15; datos(3).ra_max = 3.67 * 15;
  datos(3).dec_min = 46.0; datos(3).dec_max = 77.0;

  datos(4).nombre = 'Cygnus';
  datos(4).ra_min = 19.08 * 15; datos(4).ra_max = 22.67 * 15;
  datos(4).dec_min = 27.5; datos(4).dec_max = 61.0;

  datos(5).nombre = 'Leo';
  datos(5).ra_min = 9.25 * 15; datos(5).ra_max = 11.83 * 15;
  datos(5).dec_min = -6.0; datos(5).dec_max = 33.0;

  datos(6).nombre = 'Scorpius';
  datos(6).ra_min = 15.92 * 15; datos(6).ra_max = 17.58 * 15;
  datos(6).dec_min = -45.5; datos(6).dec_max = -8.0;

  datos(7).nombre = 'Taurus';
  datos(7).ra_min = 3.42 * 15; datos(7).ra_max = 5.92 * 15;
  datos(7).dec_min = -1.0; datos(7).dec_max = 31.0;

  datos(8).nombre = 'Virgo';
  datos(8).ra_min = 11.67 * 15; datos(8).ra_max = 15.08 * 15;
  datos(8).dec_min = -22.0; datos(8).dec_max = 14.0;

  datos(9).nombre = 'Centaurus';
  datos(9).ra_min = 11.33 * 15; datos(9).ra_max = 15.08 * 15;
  datos(9).dec_min = -64.0; datos(9).dec_max = -29.5;

  datos(10).nombre = 'Aquila';
  datos(10).ra_min = 18.67 * 15; datos(10).ra_max = 20.83 * 15;
  datos(10).dec_min = -12.0; datos(10).dec_max = 19.0;
endfunction
