#ifndef ASTRONOMY_UTILS_H
#define ASTRONOMY_UTILS_H

#include <cmath>

// Constantes astronómicas
const double DEG_TO_RAD = M_PI / 180.0;
const double HOUR_TO_RAD = M_PI / 12.0;
const double RAD_TO_DEG = 180.0 / M_PI;
const double RAD_TO_HOUR = 12.0 / M_PI;

// Función auxiliar para normalizar ángulos
inline double normalize_angle(double angle_degrees) {
    return fmod(angle_degrees + 360.0, 360.0);
}

// Función auxiliar para asegurar rangos de tiempo
inline double normalize_time(double hours) {
    return fmod(hours + 24.0, 24.0);
}

#endif 
