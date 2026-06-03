import 'dart:io';

void main() {
  int cant = 1;
  int total = 0;

  while (cant != 0) {
    print('Ingrese la cantidad de piezas producidas (0 para terminar):');
    cant = int.parse(stdin.readLineSync()!);
    total = cant + total;
  }

  if (total < 50) {
    print('Producción total acumulada: Baja');
  } else {
    print('Producción total acumulada: Adecuada');
  } 

  print('Total de piezas ingresadas a nómina: $total');
}