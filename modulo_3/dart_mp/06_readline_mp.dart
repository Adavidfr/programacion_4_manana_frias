import 'dart:io';

void main() {
  print('Ingrese el nombre del colaborador:');
  String? nombre = stdin.readLineSync();

  print('Hola, $nombre');      

  print('Ingrese la edad del colaborador:');
  int edad = int.parse(stdin.readLineSync()!);  
  print('Edad del colaborador: $edad');

  print('Ingrese el salario base diario:');
  double valor = double.parse(stdin.readLineSync()!);
  print('Salario diario: $valor');
}