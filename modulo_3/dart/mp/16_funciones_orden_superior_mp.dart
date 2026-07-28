List<double> transformarSalarios(
  List<double> salarios,
  double Function(double) transformacion,
) {
  return salarios.map(transformacion).toList();
}

void procesarEmpleados(
  List<double> salarios,
  void Function(double) accion,
) {
  for (final salario in salarios) {
    accion(salario);
  }
}

void main() {
  final salarios = [3200.0, 4200.0, 1500.0, 2800.0];

  final planSalarialAjustado = transformarSalarios(salarios, (s) => s * 0.9);
  print(planSalarialAjustado);

  final salariosAltos = salarios.where((s) => s > 3000).toList();
  print(salariosAltos);

  print('Registro de salarios de la nomina:');
  procesarEmpleados(salarios, (s) => print('Salario: \$${s.toStringAsFixed(0)} USD'));
}