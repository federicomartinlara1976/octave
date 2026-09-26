#include <octave/oct.h>
#include <astronomy_utils.h>
#include <deg2rad.h>

DEFUN_DLD (ast_deg2rad, args, , "Convierte grados a radianes - Optimizado C++")
{
	// Verificar argumentos
  	if (args.length() != 1)
    		print_usage();

  	double grados = args(0).double_value();
    
	double resultado = _deg2rad(grados);
    
    	return octave_value(resultado);
}
