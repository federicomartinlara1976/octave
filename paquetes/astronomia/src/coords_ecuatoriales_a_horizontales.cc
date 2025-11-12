#include <octave/oct.h>
#include <coords_ecuatoriales_a_horizontales.h>

DEFUN_DLD (coords_ecuatoriales_a_horizontales, args, , "Conversión de coordenadas - Optimizado C++")
{
  	// Verificar argumentos
  	if (args.length() != 4)
    		print_usage();

  	double ra = args(0).double_value();
  	double dec = args(1).double_value();
  	double lst = args(2).double_value();
  	double lat_rad = args(3).double_value();
  	
  	std::tuple<double, double> azal = _coords_ecuatoriales_a_horizontales(ra, dec, lst, lat_rad);
    
    	RowVector resultado(2);
    	resultado(0) = std::get<0>(azal);
    	resultado(1) = std::get<1>(azal);
    
    	return octave_value(resultado);
}
