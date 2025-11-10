#include <hms2deg.h>

double _hms2deg(int horas, int minutos, double segundos) {
	return horas * 15 + minutos * 0.25 + segundos * 0.00416667;
}
