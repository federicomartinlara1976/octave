#include <octave/oct.h>
#include <altaz2hadec.h>
#include <calcular_lst.h>
#include <hadec2radec.h>

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
  	
  	std::tuple<double, double> hadec = _altaz2hadec(alt, az, lat);
    double lst = _calcular_lst(fecha, lon);
    std::tuple<double, double> radec = _hadec2radec(std::get<0>(hadec), std::get<1>(hadec), lst);
    
    RowVector r_radec(2);
    r_radec(0) = std::get<0>(radec);
    r_radec(1) = std::get<1>(radec);
    
    return octave_value(r_radec);
}
