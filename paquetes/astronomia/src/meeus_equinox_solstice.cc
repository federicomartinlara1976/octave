#include <octave/oct.h>
#include <octave/parse.h>
#include <meeus_equinox_solstice.h>

using namespace std;

DEFUN_DLD (meeus_equinox_solstice, args, nargout,
           "Calcula solsticios y equinoccios (Meeus).\n"
           "Uso: [JDE, dv] = meeus_equinox_solstice(year, event)\n"
           "event: 'march_equinox', 'june_solstice', 'september_equinox', 'december_solstice'")
{
    octave_value_list retval;
    int nargin = args.length();
    if (nargin != 2) {
        print_usage();
        return retval;
    }

    double year = args(0).double_value();
    string event = args(1).string_value();
    transform(event.begin(), event.end(), event.begin(),
                   [](unsigned char c){ return tolower(c); });

    double JDE0;
    if (year <= 1000) {
        double y = year / 1000.0;
        if (event == "march_equinox") {
            JDE0 = 1721139.29189 + 365242.13740*y + 0.06134*y*y
                   + 0.00111*y*y*y - 0.00071*y*y*y*y;
        } else if (event == "june_solstice") {
            JDE0 = 1721233.25401 + 365241.72562*y - 0.05323*y*y
                   + 0.00907*y*y*y + 0.00025*y*y*y*y;
        } else if (event == "september_equinox") {
            JDE0 = 1721325.70455 + 365242.49558*y - 0.11677*y*y
                   - 0.00297*y*y*y + 0.00074*y*y*y*y;
        } else if (event == "december_solstice") {
            JDE0 = 1721414.39987 + 365242.88257*y - 0.00769*y*y
                   - 0.00933*y*y*y - 0.00006*y*y*y*y;
        } else {
            error("Evento no válido: %s", event.c_str());
            return retval;
        }
    } else {
        double y = (year - 2000) / 1000.0;
        if (event == "march_equinox") {
            JDE0 = 2451623.80984 + 365242.37404*y + 0.05169*y*y
                   - 0.00411*y*y*y - 0.00057*y*y*y*y;
        } else if (event == "june_solstice") {
            JDE0 = 2451716.56767 + 365241.62603*y + 0.00325*y*y
                   + 0.00888*y*y*y - 0.00030*y*y*y*y;
        } else if (event == "september_equinox") {
            JDE0 = 2451810.21715 + 365242.01767*y - 0.11575*y*y
                   + 0.00337*y*y*y + 0.00078*y*y*y*y;
        } else if (event == "december_solstice") {
            JDE0 = 2451900.05952 + 365242.74049*y - 0.06223*y*y
                   - 0.00823*y*y*y + 0.00032*y*y*y*y;
        } else {
            error("Evento no válido: %s", event.c_str());
            return retval;
        }
    }

    double T = (JDE0 - 2451545.0) / 36525.0;
    double W = (35999.373 * T - 2.47) * M_PI / 180.0;
    double DeltaLambda = 1.0 + 0.0334 * cos(W)
                              + 0.0007 * cos(2.0 * W);

    static const double terms[][3] = {
        {485, 324.96,   1934.136},
        {203, 337.23,  32964.467},
        {199, 342.08,     20.186},
        {182,  27.85, 445267.112},
        {156,  73.14,  45036.886},
        {136, 171.52,  22518.443},
        { 77, 222.54,  65928.934},
        { 74, 296.72,   3034.906},
        { 70, 243.58,   9037.513},
        { 58, 119.81,  33718.147},
        { 52, 297.17,    150.678},
        { 50,  21.02,   2281.226},
        { 45, 247.54,  29929.562},
        { 44, 325.15,  31555.956},
        { 29,  60.93,    443.417},
        { 18, 155.12,  67555.328},
        { 17, 288.79,   4562.452},
        { 18, 198.04,  62894.029},
        { 14, 199.76,  31436.921},
        { 12,  95.39,  14577.848},
        { 12, 287.11,  31931.756},
        { 12, 320.81,  34777.259},
        {  9, 227.73,   1222.114},
        {  8,  15.45,  16859.074}
    };
    int nterms = sizeof(terms) / sizeof(terms[0]);
    double S = 0.0;
    for (int i = 0; i < nterms; ++i) {
        double A = terms[i][0];
        double B = terms[i][1] * M_PI / 180.0;
        double C = terms[i][2] * M_PI / 180.0;
        S += A * cos(B + C * T);
    }

    double JDE = JDE0 + 0.00001 * S / DeltaLambda;

    // -----------------------------------------------------------------------
    // CAMBIO: Calcular ΔT según Espenak & Meeus en lugar de usar 69 s fijos
    // -----------------------------------------------------------------------
    // Extraer mes del año decimal para la fórmula de ΔT
    // Para el año en curso, usamos el mes del evento (aproximado).
    // Se puede refinar pasando el mes como argumento adicional si se desea.
    double mes_evento = 6.0; // valor por defecto (junio) para el solsticio
    // Determinar mes aproximado según el evento
    if (event == "march_equinox") mes_evento = 3.0;
    else if (event == "june_solstice") mes_evento = 6.0;
    else if (event == "september_equinox") mes_evento = 9.0;
    else if (event == "december_solstice") mes_evento = 12.0;

    double delta_T = DeltaT_EspenakMeeus(year, mes_evento);
    double JD_utc = JDE - delta_T / 86400.0;

    tuple<int, int, int, int, int, double> date = jd2datevec(JD_utc);

    RowVector dv(6);
    dv(0) = get<0>(date);
    dv(1) = get<1>(date);
    dv(2) = get<2>(date);
    dv(3) = get<3>(date);
    dv(4) = get<4>(date);
    dv(5) = get<5>(date);
    
    retval(0) = JDE;
    if (nargout > 1) retval(1) = dv;
    return retval;
}
