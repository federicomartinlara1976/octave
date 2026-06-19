#include <octave/oct.h>
#include <deg2hms.h>

DEFUN_DLD (deg2hms, args, , "Convertir grados a HMS - Optimizado para C++")
{
  	// Verificar argumentos
  	if (args.length() != 1)
    		print_usage();

  	double grados = args(0).double_value();
    
    	std::tuple<int, int, double> hms = _deg2hms(grados);
    
    	RowVector resultado(3);
    	resultado(0) = std::get<0>(hms);
    	resultado(1) = std::get<1>(hms);
    	resultado(2) = std::get<2>(hms);
    
    	return octave_value(resultado);
}
