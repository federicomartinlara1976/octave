#include <octave/oct.h>
#include <hms2deg.h>

DEFUN_DLD (hms2deg, args, , "Convierte horas, minutos, segundos a grados - Optimizado C++")
{
  	// Verificar argumentos
  	if (args.length() != 3)
    		print_usage();

  	int horas = args(0).int_value();
  	int minutos = args(1).int_value();
  	double segundos = args(2).double_value();
    
    	double resultado = _hms2deg(horas, minutos, segundos);
    
    	return octave_value(resultado);
}
