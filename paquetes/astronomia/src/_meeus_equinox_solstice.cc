#include <meeus_equinox_solstice.h>

#include <cmath>
#include <string>
#include <algorithm>
#include <cctype>
#include <tuple>

using namespace std;

// Convierte Día Juliano a [año, mes, día, hora, min, seg]
tuple<int, int, int, int, int, double> jd2datevec(double jd) {
    jd += 0.5;
    
    double Z = floor(jd);
    double F = jd - Z;
    double A;
    
    if (Z < 2299161.0) {
        A = Z;
    } else {
        double alpha = floor((Z - 1867216.25) / 36524.25);
        A = Z + 1.0 + alpha - floor(alpha / 4.0);
    }
    
    double B = A + 1524.0;
    double C = floor((B - 122.1) / 365.25);
    double D = floor(365.25 * C);
    double E = floor((B - D) / 30.6001);
    double day = B - D - floor(30.6001 * E) + F;
    int month = (E < 14) ? static_cast<int>(E - 1) : static_cast<int>(E - 13);
    int year = (month > 2) ? static_cast<int>(C - 4716) : static_cast<int>(C - 4715);
    int day_int = static_cast<int>(std::floor(day));
    double frac = day - day_int;
    double hours = frac * 24.0;
    int hour_int = static_cast<int>(std::floor(hours));
    double minutes = (hours - hour_int) * 60.0;
    int min_int = static_cast<int>(std::floor(minutes));
    double seconds = (minutes - min_int) * 60.0;

    return make_tuple(year, month, day_int, hour_int, min_int, seconds);
}

// ---------------------------------------------------------------------------
// ΔT según Espenak & Meeus (2006) - "Five Millennium Canon of Solar Eclipses"
// Intervalo de validez: -1999 a +3000
// ---------------------------------------------------------------------------
double DeltaT_EspenakMeeus(double year, double month) {
    // Año decimal "y" (centrado en la mitad del mes)
    double y = year + (month - 0.5) / 12.0;
    double u, t;

    if (year < -500) {
        // Antes del año -500
        u = (y - 1820.0) / 100.0;
        return -20.0 + 32.0 * u * u;
    }
    else if (year >= -500 && year < 500) {
        // Entre -500 y +500
        u = y / 100.0;
        return 10583.6 - 1014.41 * u + 33.78311 * u*u
               - 5.952053 * u*u*u - 0.1798452 * u*u*u*u
               + 0.022174192 * u*u*u*u*u
               + 0.0090316521 * u*u*u*u*u*u;
    }
    else if (year >= 500 && year < 1600) {
        // Entre +500 y +1600
        u = (y - 1000.0) / 100.0;
        return 1574.2 - 556.01 * u + 71.23472 * u*u
               + 0.319781 * u*u*u - 0.8503463 * u*u*u*u
               - 0.005050998 * u*u*u*u*u
               + 0.0083572073 * u*u*u*u*u*u;
    }
    else if (year >= 1600 && year < 1700) {
        // Entre +1600 y +1700
        t = y - 1600.0;
        return 120.0 - 0.9808 * t - 0.01532 * t*t + t*t*t / 7129.0;
    }
    else if (year >= 1700 && year < 1800) {
        // Entre +1700 y +1800
        t = y - 1700.0;
        return 8.83 + 0.1603 * t - 0.0059285 * t*t
               + 0.00013336 * t*t*t - t*t*t*t / 1174000.0;
    }
    else if (year >= 1800 && year < 1860) {
        // Entre +1800 y +1860
        t = y - 1800.0;
        return 13.72 - 0.332447 * t + 0.0068612 * t*t
               + 0.0041116 * t*t*t - 0.00037436 * t*t*t*t
               + 0.0000121272 * t*t*t*t*t
               - 0.0000001699 * t*t*t*t*t*t
               + 0.000000000875 * t*t*t*t*t*t*t;
    }
    else if (year >= 1860 && year < 1900) {
        // Entre +1860 y +1900
        t = y - 1860.0;
        return 7.62 + 0.5737 * t - 0.251754 * t*t
               + 0.01680668 * t*t*t
               - 0.0004473624 * t*t*t*t
               + t*t*t*t*t / 233174.0;
    }
    else if (year >= 1900 && year < 1920) {
        // Entre +1900 y +1920
        t = y - 1900.0;
        return -2.79 + 1.494119 * t - 0.0598939 * t*t
               + 0.0061966 * t*t*t - 0.000197 * t*t*t*t;
    }
    else if (year >= 1920 && year < 1941) {
        // Entre +1920 y +1941
        t = y - 1920.0;
        return 21.20 + 0.84493 * t - 0.076100 * t*t
               + 0.0020936 * t*t*t;
    }
    else if (year >= 1941 && year < 1961) {
        // Entre +1941 y +1961
        t = y - 1950.0;
        return 29.07 + 0.407 * t - t*t / 233.0 + t*t*t / 2547.0;
    }
    else if (year >= 1961 && year < 1986) {
        // Entre +1961 y +1986
        t = y - 1975.0;
        return 45.45 + 1.067 * t - t*t / 260.0 - t*t*t / 718.0;
    }
    else if (year >= 1986 && year < 2005) {
        // Entre +1986 y +2005
        t = y - 2000.0;
        return 63.86 + 0.3345 * t - 0.060374 * t*t
               + 0.0017275 * t*t*t
               + 0.000651814 * t*t*t*t
               + 0.00002373599 * t*t*t*t*t;
    }
    else if (year >= 2005 && year < 2050) {
        // Entre +2005 y +2050
        t = y - 2000.0;
        return 62.92 + 0.32217 * t + 0.005589 * t*t;
    }
    else if (year >= 2050 && year < 2150) {
        // Entre +2050 y +2150
        u = (y - 1820.0) / 100.0;
        return -20.0 + 32.0 * u * u - 0.5628 * (2150.0 - y);
    }
    else {
        // Después de +2150
        u = (y - 1820.0) / 100.0;
        return -20.0 + 32.0 * u * u;
    }
}
