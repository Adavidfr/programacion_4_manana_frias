class ContratoLaboral {
  final String empleado;
  final String puesto;
  final int duracionMeses;
  final bool periodoPrueba;

  ContratoLaboral({
    required this.empleado,
    required this.puesto,
    required this.duracionMeses,
    this.periodoPrueba = false,
  });

  ContratoLaboral.inicial()
      : empleado = 'Nuevo empleado',
        puesto = 'Evaluacion inicial',
        duracionMeses = 12,
        periodoPrueba = true;

  ContratoLaboral.express({required this.empleado})
      : puesto = 'Contrato temporal express',
        duracionMeses = 3,
        periodoPrueba = false;

  factory ContratoLaboral.desdePerfil(String perfil) {
    if (perfil == 'ejecutivo') {
      return ContratoLaboral(
        empleado: 'Director Regional',
        puesto: 'Gerencia General',
        duracionMeses: 36,
        periodoPrueba: true,
      );
    }
    return ContratoLaboral(
      empleado: 'Analista',
      puesto: 'Recursos Humanos',
      duracionMeses: 12,
    );
  }

  @override
  String toString() {
    return 'ContratoLaboral(empleado: $empleado, puesto: $puesto, duracionMeses: $duracionMeses, periodoPrueba: $periodoPrueba)';
  }
}

void main() {
  final contrato1 = ContratoLaboral(
    empleado: 'Maria',
    puesto: 'Desarrolladora Senior',
    duracionMeses: 24,
    periodoPrueba: true,
  );
  final contrato2 = ContratoLaboral.inicial();
  final contrato3 = ContratoLaboral.desdePerfil('ejecutivo');

  print(contrato1);
  print(contrato2);
  print(contrato3);
}