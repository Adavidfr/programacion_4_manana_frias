void main() {
  // Verificación de salud y temperatura del empleado al ingreso
  int temperatura = 38;

  if (temperatura > 37.5) {
    print('Fiebre - Acceso denegado, reportar a RRHH para incapacidad');
  } else if (temperatura > 36) {
    print('Normal - Acceso autorizado');
  } else {
    print('Alerta - Temperatura corporal baja, verificar en enfermería');
  }

  // Operador ternario para decisiones rápidas de acceso
  String estadoAcceso = temperatura > 37.5 ? 'Con incapacidad temporal' : 'Apto para laborar';
  print(estadoAcceso);

  // null-aware con ternario para departamento del empleado
  String? depto;
  String deptoDisplay = depto != null ? depto.toUpperCase() : 'Sin departamento asignado';

  // Forma más concisa con Elvis
  String deptoDisplay2 = depto?.toUpperCase() ?? 'Sin departamento asignado';
  print(deptoDisplay2);
}