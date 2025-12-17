#include <deg2hms.h>

std::tuple<int, int, double> _deg2hms(double grados) {
	double total_horas = grados / 15.0;
    	int horas = static_cast<int>(total_horas);
    	double resto = total_horas - horas;
    
    	int minutos = static_cast<int>(resto * 60.0);
    	double segundos = (resto * 60.0 - minutos) * 60.0;
    
    	// Asegurar valores válidos
    	segundos = std::max(0.0, std::min(segundos, 59.999));
    	
    	return std::make_tuple(horas, minutos, segundos);
}
