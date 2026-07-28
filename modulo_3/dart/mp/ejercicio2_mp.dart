import 'dart:io';

void main() {
  int evaluaciones = -1;
  int totalEvaluaciones = 0;
  int totalReclutadores = 0;

  while (evaluaciones != 0) {
    print("Ingrese la cantidad de evaluaciones de desempeño realizadas por el reclutador (0 para terminar): ");
    evaluaciones = int.parse(stdin.readLineSync()!);

    if (evaluaciones == 0) {
      break;
    }

    if (evaluaciones <= 20) {
      print("Rendimiento bajo");
    } 
    else if (evaluaciones <= 50) {
      print("Rendimiento normal");
    } 
    else {
      print("Rendimiento excelente");
    }

    totalReclutadores += 1;
    totalEvaluaciones += evaluaciones;
  }

  print("Total de evaluaciones realizadas: $totalEvaluaciones");
  print("Total de reclutadores: $totalReclutadores");
  print("Promedio: ${totalEvaluaciones / totalReclutadores}");
}