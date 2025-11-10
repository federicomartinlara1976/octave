#include <hadec2radec.h>

std::tuple<double, double> _hadec2radec(double ha, double dec_hadec, double lst) {
	double ra = fmod(lst - ha/15, 24);
    	return std::make_tuple(ra, dec_hadec);
}
