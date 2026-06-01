import 'dart:io';

void main() {
  int horas = 1;
  int candidatos = 0;
  int totalCandidatos = 0;
  int reclutadores = 0;

  while (horas != 0) {
    print("Ingrese horas laboradas del reclutador (0 para finalizar):");
    horas = int.parse(stdin.readLineSync()!);

    if (horas == 0) {
      break;
    }

    print("Ingrese cantidad de candidatos entrevistados:");
    candidatos = int.parse(stdin.readLineSync()!);

    double entrevistasPorHora = candidatos / horas;

    totalCandidatos += candidatos;
    reclutadores++;

    print("Entrevistas por hora: ${entrevistasPorHora.toStringAsFixed(2)}");

    if (entrevistasPorHora < 1.5) {
      print("Rendimiento del reclutador: Lento");
    } else if (entrevistasPorHora >= 1.5 && entrevistasPorHora <= 3.0) {
      print("Rendimiento del reclutador: Promedio");
    } else {
      print("Rendimiento del reclutador: Sobresaliente");
    }
  }

  if (reclutadores > 0) {
    double promedio = totalCandidatos / reclutadores;

    print("\n===== RESULTADOS DE RECLUTAMIENTO =====");
    print("Total de candidatos evaluados: $totalCandidatos");
    print("Cantidad de reclutadores activos: $reclutadores");
    print("Promedio de entrevistas por reclutador: ${promedio.toStringAsFixed(2)}");
  } else {
    print("No se registraron reclutadores.");
  }
}