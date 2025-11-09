#include <octave/oct.h>
#include <deg2rad.h>
#include <rad2deg.h>

DEFUN_DLD (deg2hms, args, , "Convierte coordenadas altazimutales a horarias - Optimizado para C++")
{
  	// Verificar argumentos
  	if (args.length() != 3)
    		print_usage();

  	double alt = args(0).double_value();
  	double az = args(0).double_value();
  	double lat = args(0).double_value();
  	
  	double alt_rad = _deg2rad(alt);
    	double az_rad = _deg2rad(az);
    	double lat_rad = _deg2rad(lat);
    
    	double dec_rad = asin(sin(alt_rad) * sin(lat_rad) + cos(alt_rad) * cos(lat_rad) * cos(az_rad));
    	double ha_rad = atan2(-sin(az_rad) * cos(alt_rad), -cos(az_rad) * sin(lat_rad) * cos(alt_rad) + sin(alt_rad) * cos(lat_rad));
    
    	double ha = _rad2deg(ha_rad);
    	double dec = _rad2deg(dec_rad);
    
    	RowVector resultado(2);
    	resultado(0) = ha;
    	resultado(1) = dec;
    
    	return octave_value(resultado);
}
