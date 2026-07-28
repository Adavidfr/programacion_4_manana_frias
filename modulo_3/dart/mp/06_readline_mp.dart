import 'dart:io';

void main() {
  print('Ingrese el nombre del empleado:');  // Imprime mensaje

  String? nombreEmpleado = stdin.readLineSync();   // Lee una línea de entrada

  print('Empleado registrado: $nombreEmpleado');      

  print('Ingrese los días trabajados (entero):');
  int diasTrabajados = int.parse(stdin.readLineSync()!);  
  print('Días trabajados: $diasTrabajados');

  print('Ingrese el salario por día (decimal):');
  double salarioPorDia = double.parse(stdin.readLineSync()!);
  print('Salario por día: $salarioPorDia');
}