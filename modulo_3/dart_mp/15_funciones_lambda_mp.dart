void main() {
  // Lambda para calcular salario neto diario
  final salarioNetoDiario = (double bruto) => bruto * 0.92; // 8% retenciones
  print('Salario neto diario (100.0 bruto): \\$\${salarioNetoDiario(100.0)}');

  // Lambda de cuerpo completo para cálculo de liquidación
  final calcularLiquidacion = (double salarioMensual, int aniosServicio) {
    final indemnizacion = salarioMensual * aniosServicio;
    final primaAntiguedad = 120.50 * aniosServicio;
    return indemnizacion + primaAntiguedad;
  };
  print('Liquidación recomendada: \\$\${calcularLiquidacion(2000.0, 5)}');

  // Lambda en línea para ordenar empleados por ID numérico en orden descendente
  final idsEmpleados = [105, 101, 109, 102, 104];
  idsEmpleados.sort((a, b) => b.compareTo(a));
  print('Identificadores de empleados ordenados: $idsEmpleados');
}