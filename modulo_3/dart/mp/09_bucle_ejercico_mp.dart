import 'dart:io';

void main() {
  print('Ingrese la tarifa por hora extra para calcular la tabla de compensaciones:');
  int tarifaHora = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    print('$i horas extras x \$$tarifaHora = \$${tarifaHora * i}');
  }
}