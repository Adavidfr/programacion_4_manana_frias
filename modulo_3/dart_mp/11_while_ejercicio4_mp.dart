import 'dart:io';

void main() {
  int total = 0;
  int cantidad = 1;
  int empleados = 0;
  int horas = 1;

  while (horas > 0) {
    print('Ingrese la cantidad de horas trabajadas (0 para terminar):');
    horas = int.parse(stdin.readLineSync()!);  
      
    if(horas > 0){
      print('Ingrese la cantidad de sillas fabricadas por el empleado: ');
      cantidad = int.parse(stdin.readLineSync()!); 
      empleados++;
    } else {
      cantidad = 0;
    }
    
    total = cantidad + total;
    if (horas > 0) {
      double pr = cantidad / horas;
      print('Sillas fabricadas por hora: $pr');
      if (pr < 2) {
        print('Productividad: Baja');
      } else if (pr < 4) {
        print('Productividad: Normal');
      } else {
        print('Productividad: Alta');
      }
    }
  }
  
  if (empleados > 0) {
    double promedio = total / empleados;
    print('Total piezas producidas: $total');
    print('Total de empleados registrados: $empleados');
    print('Promedio de producción por empleado: $promedio');
  } else {
    print('No se registraron datos.');
  }
}