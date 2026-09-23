#ifndef MEEUS_EQUINOX_SOLSTICE_H
#define MEEUS_EQUINOX_SOLSTICE_H

#include <tuple>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

using namespace std;

// Convierte Día Juliano a [año, mes, día, hora, min, seg]
tuple<int, int, int, int, int, double> jd2datevec(double jd);

// Calcula ΔT (TT - UT) en segundos según Espenak & Meeus (2006)
double DeltaT_EspenakMeeus(double year, double month);

#endif 
