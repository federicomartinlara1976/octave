#include <fecha_juliana.h>

int _fecha_juliana (int anio, int mes, int dia, int hora, int minuto, int segundo) {
	int a, m, b, jd;
	
	if (mes <= 2) {
        	a = anio - 1;
        	m = mes + 12;
    	}
    
    	a = floor(a / 100);
    	b = 2 - a + floor(a / 4);
    
    	jd = floor(365.25 * (anio + 4716)) + floor(30.6001 * (mes + 1)) + dia + b - 1524.5 + (hora + minuto/60 + segundo/3600) / 24;
    	
    	return jd;
}
