import 'dart:io';

void main() {
  print('Ingrese la calificación de evaluación de desempeño del empleado:');
  int calificacion = int.parse(stdin.readLineSync()!);
  if (calificacion >= 7) {
    print('Desempeño Aprobado');
  } else if (calificacion < 7)
    print('Desempeño Insuficiente');
}