#include <octave/oct.h>
#include <astronomy_utils.h>
#include <hadec2radec.h>

DEFUN_DLD (hadec2radec, args, , "Convierte coordenadas horarias a ecuatoriales - Optimizado C++")
{
	// Verificar argumentos
  	if (args.length() != 3)
    		print_usage();

  	double ha = args(0).double_value();
  	double dec_hadec = args(1).double_value();
  	double lst = args(2).double_value();
    
	std::tuple<double, double> radec = _hadec2radec(ha, dec_hadec, lst);
	
	RowVector resultado(2);
    	resultado(0) = std::get<0>(radec);
    	resultado(1) = std::get<1>(radec);
    
    	return octave_value(resultado);
}
