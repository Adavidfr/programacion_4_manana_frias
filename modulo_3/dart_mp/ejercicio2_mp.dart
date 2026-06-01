import 'dart:io';

void main() {
  int cajas = -1;
  int totalCajas = 0;
  int totalEmpleados = 0;

  while (cajas != 0) {
    print("Ingrese la cantidad de cajas empacadas por el empleado (0 para terminar): ");
    cajas = int.parse(stdin.readLineSync()!);

    if (cajas == 0) {
      break;
    }

    if (cajas <= 20) {
      print("Rendimiento: Bajo");
    } 
    else if (cajas <= 50) {
      print("Rendimiento: Normal");
    } 
    else {
      print("Rendimiento: Excelente");
    }

    totalEmpleados += 1;
    totalCajas += cajas;
  }

  print("Total de cajas empacadas por el equipo: \$totalCajas");
  print("Total de empleados evaluados: \$totalEmpleados");
  print("Promedio de cajas empacadas por empleado: \${totalCajas / totalEmpleados}");
}