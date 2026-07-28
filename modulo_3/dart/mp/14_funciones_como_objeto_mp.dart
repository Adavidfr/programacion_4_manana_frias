double sumarBonificaciones(double a, double b) => a + b;
double restarDeducciones(double a, double b) => a - b;

double aplicarCalculoSalarial(
  double valor1,
  double valor2,
  double Function(double, double) operacion,
) {
  return operacion(valor1, valor2);
}

double Function(double) crearAjusteSalarial(double porcentaje) {
  return (double valor) => valor * (1 + porcentaje / 100);
}

void main() {
  final operacion = sumarBonificaciones;
  print(operacion(350.0, 120.0));

  print(aplicarCalculoSalarial(2200.0, 500.0, restarDeducciones));
  print(aplicarCalculoSalarial(1800.0, 200.0, (a, b) => a + b));

  final ajustarSalarial = crearAjusteSalarial(10);
  print(ajustarSalarial(1800.0));
}