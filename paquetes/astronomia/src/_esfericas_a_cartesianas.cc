#include <deg2rad.h>
#include <esfericas_a_cartesianas.h>

std::tuple<double, double, double> _esfericas_a_cartesianas(double azimuth, double altura) {
  	
  	double az_rad = _deg2rad(azimuth);
  	double alt_rad = _deg2rad(altura);
  
  	double r = 1.0;  // Radio unitario
  
  	double x = r * cos(alt_rad) * sin(az_rad);
  	double y = r * cos(alt_rad) * cos(az_rad);
  	double z = r * sin(alt_rad);
     
    	return std::make_tuple(x, y, z);
}
