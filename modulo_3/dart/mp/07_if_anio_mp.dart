import 'dart:io';

void main() {
  print('Ingrese el año fiscal para auditoría de nómina: ');
  int anio = int.parse(stdin.readLineSync()!);

  if ((anio % 4 == 0 && anio % 100 != 0) || (anio % 400 == 0)) {
    print('El año fiscal es bisiesto (366 días de cálculo de nómina)');
  } else {
    print('El año fiscal no es bisiesto (365 días de cálculo de nómina)');
  }
}