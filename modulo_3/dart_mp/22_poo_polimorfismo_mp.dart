// Jerarquía de Colaboradores
abstract class Colaborador {
  String get nombre;
  double calcularBonoAnual();
}

class DesarrolladorPoli extends Colaborador {
  final double salarioBase;
  DesarrolladorPoli(this.salarioBase);
  @override String get nombre => 'Desarrollador';
  @override double calcularBonoAnual() => salarioBase * 0.12;
}

class VendedorPoli extends Colaborador {
  final double salarioBase;
  final double comisionesAcumuladas;
  VendedorPoli(this.salarioBase, this.comisionesAcumuladas);
  @override String get nombre => 'Vendedor';
  @override double calcularBonoAnual() => (salarioBase * 0.08) + comisionesAcumuladas;
}

class SoportePoli extends Colaborador {
  final double salarioBase;
  SoportePoli(this.salarioBase);
  @override String get nombre => 'Soporte Técnico';
  @override double calcularBonoAnual() => salarioBase * 0.05;
}

// POLIMORFISMO
void imprimirBonoColaborador(Colaborador c) {
  print('Bono de ${c.nombre}: \$${c.calcularBonoAnual().toStringAsFixed(2)}');
}

void main() {
  final equipo = <Colaborador>[
    DesarrolladorPoli(3000.0),
    VendedorPoli(1500.0, 450.0),
    SoportePoli(1200.0),
  ];

  print('=== Reporte General de Bonificaciones Polimórficas ===');
  for (final colaborador in equipo) {
    imprimirBonoColaborador(colaborador);
  }

  final mayorBono = equipo.reduce((a, b) => a.calcularBonoAnual() > b.calcularBonoAnual() ? a : b);
  print('\nPuesto con mayor bonificación asignada: \${mayorBono.nombre}');
}