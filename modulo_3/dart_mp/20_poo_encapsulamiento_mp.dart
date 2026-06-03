class FondoSueldoEmpleado {
  final String empleado;
  double _salarioAcumulado;

  FondoSueldoEmpleado(this.empleado, double salarioInicial)
      : _salarioAcumulado = salarioInicial;

  // Getter
  double get salarioAcumulado => _salarioAcumulado;

  // Incrementar salario por bonos
  void agregarBono(double monto) {
    if (monto <= 0) throw ArgumentError('El bono debe ser positivo');
    _salarioAcumulado += monto;
    print('Bono de \\$\${monto} agregado a $empleado. Fondo actual: \\$\${_salarioAcumulado}');
  }

  // Descontar por faltas o anticipos
  void aplicarDescuento(double monto) {
    if (monto <= 0)                  throw ArgumentError('El descuento debe ser positivo');
    if (monto > _salarioAcumulado)  throw StateError('El descuento supera el fondo acumulado');
    _salarioAcumulado -= monto;
    print('Descuento de \\$\${monto} aplicado a $empleado. Fondo actual: \\$\${_salarioAcumulado}');
  }
}

void main() {
  final fondo = FondoSueldoEmpleado('Carlos Ruiz', 1500.0);

  fondo.agregarBono(200.0);
  fondo.aplicarDescuento(150.0);
  print('Total acumulado final de \${fondo.empleado}: \\$\${fondo.salarioAcumulado}');
}