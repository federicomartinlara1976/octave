#include <deg2rad.h>
#include <rad2deg.h>
#include <altaz2hadec.h>

using namespace std;

tuple<double, double> _altaz2hadec(double altura, double azimut, double latitud) {
  	
  	// En radianes
  	double alt_rad = _deg2rad(altura);
    	double az_rad = _deg2rad(azimut);
    	double lat_rad = _deg2rad(latitud);
    
    	// Fórmulas
    	double dec_rad = asin(sin(alt_rad) * sin(lat_rad) + cos(alt_rad) * cos(lat_rad) * cos(az_rad));
    	double ha_rad = atan2(-sin(az_rad) * cos(alt_rad), -cos(az_rad) * sin(lat_rad) * cos(alt_rad) + sin(alt_rad) * cos(lat_rad));
    
    	// Pasar a grados
    	double ha_deg = _rad2deg(ha_rad);
    	double dec_deg = _rad2deg(dec_rad);
    
    	return make_tuple(ha_deg, dec_deg);
}
