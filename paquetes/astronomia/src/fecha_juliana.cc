#include <octave/oct.h>
#include <astronomy_utils.h>
#include <fecha_juliana.h>

DEFUN_DLD (calcular_altura, args, , "Calcula la fecha juliana - Optimizado C++")
{
	int hora, minuto, segundo;

	// Verificar argumentos
  	if (args.length() < 4) {
  		hora = 0;
  		minuto = 0;
  		segundo = 0;
  	}
  	else {
  		hora = args(3).int_value();
  		minuto = args(4).int_value();
  		segundo = args(5).int_value();
  	}
    		
    	int anio = args(0).double_value();
  	int mes = args(1).double_value();
  	int dia = args(2).double_value();
  	
  	int resultado = _fecha_juliana(anio, mes, dia, hora, minuto, segundo);
    
    	return octave_value(resultado);
}
