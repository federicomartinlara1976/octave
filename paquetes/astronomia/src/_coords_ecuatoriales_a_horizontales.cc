#include <deg2rad.h>
#include <rad2deg.h>
#include <coords_ecuatoriales_a_horizontales.h>

std::tuple<double, double> _coords_ecuatoriales_a_horizontales(double ra, double dec, double lst, double lat_rad) {
  	
  	double ra_rad = _deg2rad(ra * 15);
  	double dec_rad = _deg2rad(dec);
  
  	// Ángulo horario
  	double h = _deg2rad((lst - ra) * 15);
  
  	// Conversión a coordenadas horizontales
  	double altura_rad = asin(sin(lat_rad) * sin(dec_rad) + cos(lat_rad) * cos(dec_rad) * cos(h));
  	double azimuth_rad = atan2(-cos(dec_rad) * sin(h), sin(dec_rad) * cos(lat_rad) - cos(dec_rad) * sin(lat_rad) * cos(h));
  
  	double azimuth = _rad2deg(azimuth_rad);
  	double altura = _rad2deg(altura_rad);
  
  	// Ajustar azimuth a rango 0-360
  	if (azimuth < 0)
    		azimuth = azimuth + 360;
     
    	return std::make_tuple(azimuth, altura);
}
