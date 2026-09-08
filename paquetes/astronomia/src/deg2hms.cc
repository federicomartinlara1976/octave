#include <octave/oct.h>
#include <deg2hms.h>

using namespace std;

DEFUN_DLD (deg2hms, args, , "Convertir grados a HMS - Optimizado para C++")
{
  	// Verificar argumentos
  	if (args.length() != 1)
    		print_usage();

  	double grados = args(0).double_value();
    
    	tuple<int, int, double> hms = _deg2hms(grados);
    
    	RowVector resultado(3);
    	resultado(0) = get<0>(hms);
    	resultado(1) = get<1>(hms);
    	resultado(2) = get<2>(hms);
    
    	return octave_value(resultado);
}
