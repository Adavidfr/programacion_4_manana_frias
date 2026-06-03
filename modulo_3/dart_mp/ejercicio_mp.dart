import 'dart:io';

void main() {
  int piezas = -1;
  int total = 0;

  while (piezas != 0) {
    print("Ingrese la cantidad de piezas producidas por el empleado (0 para terminar): ");
    piezas = int.parse(stdin.readLineSync()!);

    if (piezas == 0) {
      break;
    }

    if (piezas < 50) {
      print("Evaluación: Producción baja");
    } else {
      print("Evaluación: Producción adecuada");
    }

    total += piezas;
  }

  print("Total de piezas producidas en el turno: \$total");
}