#include <octave/oct.h>
#include <altaz2hadec.h>

using namespace std;

DEFUN_DLD (altaz2hadec, args, , "Convierte coordenadas altazimutales a horarias - Optimizado C++")
{
  	// Verificar argumentos
  	if (args.length() != 3)
    		print_usage();

  	double alt = args(0).double_value();
  	double az = args(1).double_value();
  	double lat = args(2).double_value();
  	
  	tuple<double, double> hadec = _altaz2hadec(alt, az, lat);
    
    RowVector resultado(2);
    resultado(0) = get<0>(hadec);
    resultado(1) = get<1>(hadec);
    
    return octave_value(resultado);
}
