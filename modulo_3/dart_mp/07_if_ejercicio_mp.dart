import 'dart:io';

void main() {
  print('Ingrese el balance de días de vacaciones del colaborador:');
  int balance = int.parse(stdin.readLineSync()!);
  if (balance > 0) {
    print('El colaborador tiene días de vacaciones a su favor');
  } else if (balance < 0) {
    print('El colaborador debe días de vacaciones (balance negativo)');
  } else {
    print('El colaborador no tiene días acumulados ni pendientes (balance cero)');
  }
}