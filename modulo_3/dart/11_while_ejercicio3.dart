import 'dart:io';
void main() {
    int cant = 1;
    int total= 0;

    while (cant != 0) {
    print('Ingresa su numero entero');
    cant = int.parse(stdin.readLineSync()!);
    total = cant + total;
  }

  if ( cant < 50) {
    print('Produccion baja');
  } else {
    print('Produccion Adecuada');
  } 

  print ('Total piezas ingresadas $total');


}