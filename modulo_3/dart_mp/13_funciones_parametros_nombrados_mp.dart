// Parámetros nombrados para registrar contrato
void registrarContrato({
  required String nombreEmpleado,
  required double salarioBase,
  String puesto = 'Auxiliar General',
  int periodoVacacionesDias = 15,
}) {
  print('Contrato Registrado con éxito ->');
  print('  Empleado: $nombreEmpleado');
  print('  Puesto: $puesto');
  print('  Salario Base: \\$\${salarioBase.toStringAsFixed(2)}');
  print('  Días de Vacaciones Anuales: $periodoVacacionesDias');
}

void main() {
  // Los nombrados pueden pasarse en cualquier orden
  registrarContrato(
    nombreEmpleado: 'Ana Gómez',
    salarioBase: 2500.0,
    puesto: 'Gerente de Proyectos',
    periodoVacacionesDias: 20,
  );

  // Solo los obligatorios — toma valores por defecto
  registrarContrato(
    nombreEmpleado: 'Carlos Ruiz',
    salarioBase: 1200.0,
  );
}