void main() {
  final empleados = ['Ana García', 'Carlos Ruiz', 'Beatriz López', 'David Fernández'];

  final etiquetas = empleados.map((empleado) => 'Empleado: $empleado').toList();
  print(etiquetas);

  final salarios = [1500, 2400, 1800, 3100];

  final salariosConBono = salarios.map((s) => s * 2).toList();
  print(salariosConBono);

  final calcularSalarioLiquido = (double salarioBase, double bonoProductividad) {
    final baseConAumento = salarioBase * 1.1;
    final bonos = bonoProductividad * 1.2;
    return baseConAumento + bonos;
  };
  print(calcularSalarioLiquido(1500.0, 300.0));

  final ordenarPorSalario = (int a, int b) => b.compareTo(a);
  salarios.sort(ordenarPorSalario);
  print(salarios);
}