#include <octave/oct.h>
#include <astronomy_utils.h>
#include <deg2rad.h>
#include <rad2deg.h>
#include <cmath>

DEFUN_DLD (altura_objeto, args, , "Calcula altura de un objeto sobre el horizonte - Optimizado C++")
{
	// Verificar argumentos
  	if (args.length() != 4)
    		print_usage();
    		
    	// arc: ascensión recta en horas
	// dec: declinación en grados
	// lst: tiempo sidéreo local en horas
	// lat: latitud del observador en grados

  	double arc = args(0).double_value();
  	double dec = args(1).double_value();
  	double lst = args(2).double_value();
  	double lat = args(3).double_value();
  	
  	// Convertir a radianes
  	double ar_rad = _deg2rad(arc * 15);
  	double dec_rad = _deg2rad(dec);
  	double lat_rad = _deg2rad(lat);
  	double lst_rad = _deg2rad(lst * 15);
  	
  	// Ángulo horario
  	double h = lst_rad - ar_rad;
    
    	// Fórmula de altura
  	double altura_rad = asin(sin(dec_rad) * sin(lat_rad) + cos(dec_rad) * cos(lat_rad) * cos(h));
    
	double resultado = _rad2deg(altura_rad);
    
    	return octave_value(resultado);
}
