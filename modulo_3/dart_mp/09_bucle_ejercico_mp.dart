import 'dart:io';

void main() {
  print('Ingrese la tarifa por hora básica del empleado:');
  double tarifa = double.parse(stdin.readLineSync()!);

  print('=== Proyección de Pago por Horas de Trabajo ===');
  for (int i = 1; i <= 10; i++) {
    print('\$i hora(s) = \\$\${tarifa * i}');
  }
}