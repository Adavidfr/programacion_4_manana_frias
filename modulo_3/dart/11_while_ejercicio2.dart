import 'dart:io';

void main() {

  int cajas = 1;
  int totalCajas = 0;
  int empleados = 0;

  while (true) {

    print("Ingrese cantidad de cajas empacadas (0 para finalizar):");
    cajas = int.parse(stdin.readLineSync()!);

    if (cajas == 0) {
      break;
    }

    totalCajas += cajas;
    empleados++;

    if (cajas < 20) {
      print("Rendimiento bajo");
    } else if (cajas >= 20 && cajas <= 50) {
      print("Rendimiento normal");
    } else {
      print("Rendimiento excelente");
    }
  }

  if (empleados > 0) {
    double promedio = totalCajas / empleados;

    print("Resultado");
    print("Cantidad de empleados registrados: $empleados");
    print("Total de cajas empacadas: $totalCajas");
    print("Promedio de cajas por empleado: $promedio");
  } else {
    print("No se registraron empleados.");
  }
}