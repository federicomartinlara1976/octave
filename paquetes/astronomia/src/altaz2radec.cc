#include <octave/oct.h>
#include <altaz2hadec.h>
#include <calcular_lst.h>
#include <hadec2radec.h>

using namespace std;

DEFUN_DLD (altaz2radec, args, , "Convierte directamente de alt/az a RA/Dec - Optimizado C++")
{
  	// Verificar argumentos
  	if (args.length() != 5)
    		print_usage();

  	double alt = args(0).double_value();
  	double az = args(1).double_value();
  	double lat = args(2).double_value();
  	double lon = args(3).double_value();
  	double fecha = args(4).double_value();
  	
  	tuple<double, double> hadec = _altaz2hadec(alt, az, lat);
    double lst = _calcular_lst(fecha, lon);
    tuple<double, double> radec = _hadec2radec(get<0>(hadec), get<1>(hadec), lst);
    
    RowVector resultado(2);
    resultado(0) = get<0>(radec);
    resultado(1) = get<1>(radec);
    
    return octave_value(resultado);
}
