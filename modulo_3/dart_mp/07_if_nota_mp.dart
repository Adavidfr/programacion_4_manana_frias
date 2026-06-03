import 'dart:io';

void main() {
  print('Ingrese la calificación de desempeño del empleado (1 a 10):');
  int calificacion = int.parse(stdin.readLineSync()!);
  if (calificacion >= 7) {
    print('Aprobado - Desempeño satisfactorio');
  } else {
    print('Reprobado - Requiere Plan de Mejora del Desempeño (PIP)');
  }
}