#include <octave/oct.h>
#include <esfericas_a_cartesianas.h>

DEFUN_DLD (esfericas_a_cartesianas, args, , "Conversión a coordenadas 3D - Optimizado C++")
{
  	// Verificar argumentos
  	if (args.length() != 2)
    		print_usage();

  	double azimuth = args(0).double_value();
  	double altura = args(1).double_value();
  	
  	std::tuple<double, double, double> xyz = _esfericas_a_cartesianas(azimuth, altura);
    
    	RowVector resultado(2);
    	resultado(0) = std::get<0>(xyz);
    	resultado(1) = std::get<1>(xyz);
    	resultado(2) = std::get<2>(xyz);
    
    	return octave_value(resultado);
}
