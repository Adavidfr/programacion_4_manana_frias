import 'dart:io';

void main() {
  int becasOtorgadas = 0;
  int presupuestoCapacitacion = 1024;

  while (presupuestoCapacitacion > 0) {
    final montoAsignado = presupuestoCapacitacion > 256 ? 256 : presupuestoCapacitacion;
    becasOtorgadas++;
    presupuestoCapacitacion -= montoAsignado;
    print('Empleado becado $becasOtorgadas: \$$montoAsignado USD (restante: \$$presupuestoCapacitacion USD)');
  }

  int intentosFirma = 0;
  bool contratoFirmado = false;

  do {
    intentosFirma++;
    print('Intento de conexion con el portal de RRHH #$intentosFirma...');
    if (intentosFirma == 3) contratoFirmado = true;
  } while (!contratoFirmado && intentosFirma < 5);

  print(contratoFirmado
      ? 'Firma registrada tras $intentosFirma intentos'
      : 'No se pudo registrar la firma');
}