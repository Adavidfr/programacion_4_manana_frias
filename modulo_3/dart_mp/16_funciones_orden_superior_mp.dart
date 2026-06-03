void main() {
  final salariosBrutos = [1500.0, 2500.0, 1800.0, 3200.0];

  // map para calcular salarios netos (8% de impuestos retenidos)
  final salariosNetos = salariosBrutos.map((s) => s * 0.92);
  print('Nómina neta calculada: ${salariosNetos.toList()}');

  // map sobre cargos de empleados
  final cargosOriginales = ['auxiliar', 'analista', 'gerente'];
  final cargosNormalizados = cargosOriginales.map((c) => 'PUESTO_${c.toUpperCase()}');
  print(cargosNormalizados.toList());

  // where para filtrar empleados con temperatura alta (enfermedad)
  final temperaturasIngreso = [36.2, 37.8, 38.5, 36.6, 37.1];
  final casosSospechosos = temperaturasIngreso.where((t) => t > 37.5);
  print('Casos enviados a enfermería: ${casosSospechosos.toList()}');

  // where para personal sano apto para laborar
  final aptosParaIngreso = temperaturasIngreso.where((t) => t <= 37.5);
  print('Personal apto para laborar hoy: ${aptosParaIngreso.toList()}');

  // reduce — total de nómina mensual
  final nominaTotal = salariosBrutos.reduce((acum, salario) => acum + salario);
  print('Total de Nómina Bruta: \\$\${nominaTotal.toStringAsFixed(2)}');

  // fold — total de nómina con valor inicial seguro
  final nominaTotalFold = salariosBrutos.fold(0.0, (acum, salario) => acum + salario);
  print('Total Nómina (fold): \\$\${nominaTotalFold.toStringAsFixed(2)}');

  // Encontrar el salario más alto
  final salarioMaximo = salariosBrutos.reduce((a, b) => a > b ? a : b);
  print('Mayor salario registrado: \\$\$$salarioMaximo');
}