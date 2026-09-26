#include <calcular_lst.h>

double _calcular_lst(double fecha, double longitud) {
	double jd = fecha + 2415018.5;
    	double t = (jd - 2451545.0) / 36525.0;
    	double gmst = 280.46061837 + 360.98564736629 * (jd - 2451545.0) + 0.000387933 * t * t - t * t * t / 38710000.0;
    	double lst = fmod(gmst + longitud, 360) / 15;
    	
    	// Asegurar valor positivo
    	if (lst < 0) lst += 24.0;
    	
    	return lst;
}
