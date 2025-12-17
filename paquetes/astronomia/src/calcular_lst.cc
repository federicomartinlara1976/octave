#include <octave/oct.h>
#include <astronomy_utils.h>
#include <calcular_lst.h>

DEFUN_DLD (calcular_lst, args, , "Calcula el Tiempo Sidéreo Local - Optimizado C++")
{
	// Verificar argumentos
  	if (args.length() != 2)
    		print_usage();

  	double fecha = args(0).double_value();
  	double longitud = args(1).double_value();
    
	double tiempo_sidereo_local = _calcular_lst(fecha, longitud);
    
    	return octave_value(tiempo_sidereo_local);
}
