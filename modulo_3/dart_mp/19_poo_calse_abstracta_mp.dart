// abstract class define el contrato — QUÉ puede hacer cualquier Empleado
abstract class ColaboradorBase {
  String get nombre;
  double calcularSalarioMensual();
  double calcularDiasVacaciones();

  // Método concreto
  void describirFicha() {
    print('$nombre -> '
          'Salario Mensual: \\$\${calcularSalarioMensual().toStringAsFixed(2)}, '
          'Vacaciones/Año: ${calcularDiasVacaciones().toStringAsFixed(0)} días');
  }
}

// Implementaciones de planta y temporal
class EmpleadoDePlanta extends ColaboradorBase {
  final String nombreEmpleado;
  final double salarioDiario;
  
  EmpleadoDePlanta(this.nombreEmpleado, this.salarioDiario);

  @override String get nombre => '$nombreEmpleado (Planta)';
  @override double calcularSalarioMensual() => salarioDiario * 30 * 1.10; // Bono del 10%
  @override double calcularDiasVacaciones() => 15.0;
}

class EmpleadoPorHonorarios extends ColaboradorBase {
  final String nombreEmpleado;
  final double pagoPorHora;
  final int    horasTrabajadas;
  
  EmpleadoPorHonorarios(this.nombreEmpleado, this.pagoPorHora, this.horasTrabajadas);

  @override String get nombre => '$nombreEmpleado (Honorarios/Freelance)';
  @override double calcularSalarioMensual() => pagoPorHora * horasTrabajadas;
  @override double calcularDiasVacaciones() => 0.0;
}

void main() {
  final personal = <ColaboradorBase>[
    EmpleadoDePlanta('Ana Gómez', 80.0),
    EmpleadoPorHonorarios('Luis Torres', 25.0, 80)
  ];
  
  print('=== Revisión de Contratos de Personal ===');
  for (final p in personal) {
    p.describirFicha();
  }
}