#include <octave/oct.h>
#include <astronomy_utils.h>
#include <rad2deg.h>

DEFUN_DLD (rad2deg, args, , "Convierte radianes a grados - Optimizado C++")
{
	// Verificar argumentos
  	if (args.length() != 1)
    		print_usage();

  	double radianes = args(0).double_value();
    
	double grados = _rad2deg(radianes);
    
    	return octave_value(grados);
}
