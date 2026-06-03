double calcularSalarioMensual(double salarioDiario, int diasTrabajados) {
  return salarioDiario * diasTrabajados;
}

double calcularImpuesto(double salarioBruto) => salarioBruto * 0.08;

void imprimirCabecera(String area) {
  print('─── Reporte de Nómina: $area ───');
}

String formatearSalario(double monto) => '\$${monto.toStringAsFixed(2)}';

String construirCorreo(String nombre, String apellido, [String? dominio]) {
  final nombreNormalizado = nombre.toLowerCase().replaceAll(' ', '');
  final apellidoNormalizado = apellido.toLowerCase().replaceAll(' ', '');

  if (dominio != null) {
    return '$nombreNormalizado.$apellidoNormalizado@$dominio';
  }

  return '$nombreNormalizado.$apellidoNormalizado@empresa.com';
}

String clasificarPuesto(String nombre, [String nivel = 'Junior']) {
  return '$nombre ($nivel)';
}

void main() {
  imprimirCabecera('Recursos Humanos');

  final bruto = calcularSalarioMensual(50.0, 22);
  final deduccion = calcularImpuesto(bruto);
  final neto = bruto - deduccion;

  print('Salario Bruto: ${formatearSalario(bruto)}');
  print('Impuestos (8%): ${formatearSalario(deduccion)}');
  print('Salario Neto: ${formatearSalario(neto)}');

  print('Correo del empleado: ${construirCorreo('Carlos', 'Ruiz')}');
  print('Correo de contratista: ${construirCorreo('Diana', 'Silva', 'externos.com')}');

  print('Clasificación: ${clasificarPuesto('Desarrollador')}');
  print('Clasificación: ${clasificarPuesto('Gerente', 'Senior')}');
}