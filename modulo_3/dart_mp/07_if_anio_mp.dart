import 'dart:io';

void main() {
  print('Ingrese el año de contratación del empleado para calcular su ciclo especial: ');
  int anio = int.parse(stdin.readLineSync()!);

  if ((anio % 4 == 0 && anio % 100 != 0) || (anio % 400 == 0)) {
    print('El año de contratación corresponde a un año bisiesto (366 días de registro laboral)');
  } else {
    print('El año de contratación corresponde a un año estándar (365 días de registro laboral)');
  }
}