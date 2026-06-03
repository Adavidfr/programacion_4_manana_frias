import 'dart:io';

void main() {
  int tareasProcesadas = 0;
  int horasExtraPresupuesto = 40;

  while (horasExtraPresupuesto > 0) {
    final horasAsignadas =
        horasExtraPresupuesto > 8 ? 8 : horasExtraPresupuesto;

    tareasProcesadas++;
    horasExtraPresupuesto -= horasAsignadas;

    print(
        'Asignación #$tareasProcesadas: $horasAsignadas horas extras asignadas (restante: $horasExtraPresupuesto)');
  }

  int reintentosBiometricos = 0;
  bool lecturaCorrecta = false;

  do {
    reintentosBiometricos++;

    print(
        'Intento de lectura biométrica de huella #$reintentosBiometricos...');

    if (reintentosBiometricos == 3) {
      lecturaCorrecta = true;
    }
  } while (!lecturaCorrecta && reintentosBiometricos < 5);

  print(
    lecturaCorrecta
        ? 'Acceso concedido tras $reintentosBiometricos intentos de escaneo'
        : 'Acceso denegado: Por favor contacte a Recursos Humanos',
  );
}