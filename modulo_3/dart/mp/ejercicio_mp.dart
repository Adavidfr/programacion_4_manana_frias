import 'dart:io';

void main() {
  int contrataciones = -1;
  int total = 0;

  while (contrataciones != 0) {
    print("Ingrese la cantidad de contrataciones realizadas por el reclutador (0 para terminar): ");
    contrataciones = int.parse(stdin.readLineSync()!);

    if (contrataciones == 0) {
      break;
    }

    if (contrataciones < 5) {
      print("Rendimiento de contratación bajo");
    } else {
      print("Rendimiento de contratación adecuado");
    }

    total += contrataciones;
  }

  print("Total de contrataciones realizadas: $total");
}