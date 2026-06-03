double calcularBonoPuntualidad(double salario) => salario * 0.05; // 5% bono
double calcularBonoDesempeno(double salario) => salario * 0.10;  // 10% bono

void main() {
  // Variable de tipo función
  double Function(double) operacionBono;

  operacionBono = calcularBonoPuntualidad;
  print('Bono de Puntualidad: \\$\${operacionBono(2000.0)}');

  operacionBono = calcularBonoDesempeno;
  print('Bono de Desempeño: \\$\${operacionBono(2000.0)}');

  // Lista de funciones de compensación
  final planesCompensacion = <double Function(double)>[
    calcularBonoPuntualidad,
    calcularBonoDesempeno
  ];

  print('=== Aplicación de Beneficios ===');
  for (final fn in planesCompensacion) {
    print('Beneficio aplicado: \\$\${fn(1500.0)}');
  }
}