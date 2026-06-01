import 'dart:io';

void main() {

  int horas = 1;
  int pacientes = 0;

  int totalPacientes = 0;
  int doctores = 0;

  while (horas != 0) {

    print("Ingrese horas trabajadas del doctor (0 para finalizar):");
    horas = int.parse(stdin.readLineSync()!);

    // Finaliza si ingresa 0
    if (horas == 0) {
      break;
    }

    print("Ingrese cantidad de pacientes atendidos:");
    pacientes = int.parse(stdin.readLineSync()!);

    double pacientesPorHora = pacientes / horas;

    totalPacientes += pacientes;
    doctores++;

    print("Pacientes por hora: ${pacientesPorHora.toStringAsFixed(2)}");

    // Validación correcta
    if (pacientesPorHora < 3) {
      print("Atención lenta");
    } else if (pacientesPorHora >= 3 && pacientesPorHora <= 6) {
      print("Atención normal");
    } else if (pacientesPorHora > 6) {
      print("Atención rápida");
    }
  }

  if (doctores > 0) {

    double promedio = totalPacientes / doctores;

    print("\n===== RESULTADOS =====");
    print("Total de pacientes atendidos: $totalPacientes");
    print("Cantidad de doctores registrados: $doctores");
    print("Promedio de pacientes por doctor: ${promedio.toStringAsFixed(2)}");

  } else {
    print("No se registraron doctores.");
  }
}