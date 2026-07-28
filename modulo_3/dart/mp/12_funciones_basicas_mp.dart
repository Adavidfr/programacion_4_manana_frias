import 'dart:io';

int calcularSalarioBruto(int horas, int tarifa) {
  return horas * tarifa;
}

int calcularDeducciones(int salarioBruto, int porcentaje) => (salarioBruto * porcentaje) ~/ 100;

void imprimirSeccionRRHH(String titulo) {
  print('--- SISTEMA DE RECURSOS HUMANOS: $titulo ---');
}

String formatearFichaEmpleado(String empleado, int salarioBruto) => 'Empleado: $empleado | Salario Bruto: \$$salarioBruto USD';

formatearFichaSinTipo(String empleado, int salarioBruto) => 'Empleado: $empleado | Salario Bruto: \$$salarioBruto USD';

void main() {
  int salarioTotal = calcularSalarioBruto(160, 15);
  int deduccionesValor = calcularDeducciones(salarioTotal, 10);

  imprimirSeccionRRHH('REPORTE DE NOMINA MENSUAL');
  print('Salario calculado: \$$salarioTotal USD');
  print('Deducciones aplicadas: \$$deduccionesValor USD');

  print(formatearFichaEmpleado('Lucia Martinez', salarioTotal));
  print(formatearFichaSinTipo('Carlos Ruiz', 1800));
}