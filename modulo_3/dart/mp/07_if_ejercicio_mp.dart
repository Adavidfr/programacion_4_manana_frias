import 'dart:io';

void main() {
  print('Ingrese el balance de horas extras del empleado:');
  int horas = int.parse(stdin.readLineSync()!);
  if (horas > 0) {
    print('El empleado tiene horas extras a favor');
  } else if (horas < 0) {
    print('El empleado debe horas de trabajo');
  } else {
    print('El balance de horas está en cero');
  }
}