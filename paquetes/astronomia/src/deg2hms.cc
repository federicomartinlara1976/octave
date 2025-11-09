 #include <octave/oct.h>
#include <cmath>
#include <algorithm>

DEFUN_DLD (deg2hms, args, , "Convert degrees to HMS - Optimized C++")
{
  // Verificar argumentos
  if (args.length() != 1)
    print_usage();

  // Soporte para escalares y matrices
  if (args(0).is_scalar_type()) {
    double grados = args(0).double_value();
    
    // Cálculo optimizado - sin bucles
    double total_horas = grados / 15.0;
    int horas = static_cast<int>(total_horas);
    double resto = total_horas - horas;
    
    int minutos = static_cast<int>(resto * 60.0);
    double segundos = (resto * 60.0 - minutos) * 60.0;
    
    // Asegurar valores válidos
    segundos = std::max(0.0, std::min(segundos, 59.999));
    
    RowVector resultado(3);
    resultado(0) = horas;
    resultado(1) = minutos;
    resultado(2) = segundos;
    
    return octave_value(resultado);
  }
  else {
    // Versión vectorizada para matrices
    Matrix grados_mat = args(0).matrix_value();
    Matrix resultado(grados_mat.rows(), 3);
    
    for (int i = 0; i < grados_mat.rows(); i++) {
      for (int j = 0; j < grados_mat.cols(); j++) {
        double grados = grados_mat(i, j);
        double total_horas = grados / 15.0;
        int horas = static_cast<int>(total_horas);
        double resto = total_horas - horas;
        
        int minutos = static_cast<int>(resto * 60.0);
        double segundos = (resto * 60.0 - minutos) * 60.0;
        
        resultado(i, 0) = horas;
        resultado(i, 1) = minutos;
        resultado(i, 2) = segundos;
      }
    }
    
    return octave_value(resultado);
  }
}
