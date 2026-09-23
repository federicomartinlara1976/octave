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
