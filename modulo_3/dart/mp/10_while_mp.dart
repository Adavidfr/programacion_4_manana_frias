import 'dart:io';

void main() {
  // while — comprueba la condición ANTES de ejecutar
  int becasOtorgadas = 0;
  int presupuestoCapacitacion = 1024;  // dólares disponibles para capacitaciones

  while (presupuestoCapacitacion > 0) {
    final montoAsignado = presupuestoCapacitacion > 256 ? 256 : presupuestoCapacitacion;
    becasOtorgadas++;
    presupuestoCapacitacion -= montoAsignado;
    print('Empleado becado $becasOtorgadas: \$$montoAsignado USD (presupuesto restante: \$$presupuestoCapacitacion USD)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ antes de comprobar
  int intentosFirma = 0;
  bool contratoFirmado = false;

  do {
    intentosFirma++;
    print('Intento de validación de firma digital #$intentosFirma...');
    // Simular que el contrato se firma digitalmente en el 3er intento
    if (intentosFirma == 3) contratoFirmado = true;
  } while (!contratoFirmado && intentosFirma < 5);

  print(contratoFirmado
      ? 'Contrato firmado exitosamente tras $intentosFirma intento(s)'
      : 'No se pudo validar la firma del contrato');
}