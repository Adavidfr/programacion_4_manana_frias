void main() {
  String rolEmpleado = 'DEV';

  // SWITCH TRADICIONAL
  switch (rolEmpleado) {
    case 'DEV':
      print('Desarrollador de Software');
    case 'PM':
      print('Gerente de Proyectos');
    case 'HR':
      print('Especialista en Recursos Humanos');
    case 'QA':
      print('Analista de Calidad');
    default:
      print('Puesto administrativo general');
  }

  // SWITCH EXPRESSION
  String puestoCodigo = 'PM';

  String descripcionPuesto = switch (puestoCodigo) {
    'DEV' => 'Desarrollador — salario base recomendado \$3000',
    'PM'  => 'Gerente de Proyectos — salario base recomendado \$4000',
    'HR'  => 'Recursos Humanos — salario base recomendado \$2500',
    'QA'  => 'Analista de Calidad — salario base recomendado \$2800',
    _     => 'Puesto no clasificado en tabulador',
  };

  print(descripcionPuesto);

  // MÚLTIPLES VALORES CON ||
  int codigoDepto = 102;

  String direccionArea = switch (codigoDepto) {
    101 || 102 || 103 => 'Dirección de Tecnología y Sistemas',
    201 || 202        => 'Dirección de Finanzas y Administración',
    301 || 302 || 303 => 'Dirección de Operaciones',
    _                 => 'Dirección General / Presidencia',
  };

  print(direccionArea);

  // GUARDS (WHEN)
  double aniosAntiguedad = 6.5;

  String categoriaBono = switch (aniosAntiguedad) {
    double a when a >= 10.0 => '🚨 Categoría Platinum — Bono 20%',
    double a when a >= 5.0  => '🔴 Categoría Gold — Bono 15%',
    double a when a >= 2.0  => '🟡 Categoría Silver — Bono 10%',
    double a when a >= 1.0  => '🟢 Categoría Bronze — Bono 5%',
    _                       => '🔵 Sin antigüedad mínima para bono especial',
  };

  print(categoriaBono);

  // PATTERN MATCHING CON TIPOS
  Object reporteIncidencia = {
    'tipo': 'Retardo',
    'minutos': 15,
    'empleado': 'Ana Gómez'
  };

  String resultadoIncidencia = switch (reporteIncidencia) {
    Map<String, dynamic> m when m['tipo'] == 'Falta' =>
      'Reporte Grave: Falta de ${m['empleado']}',

    Map<String, dynamic> m =>
      'Incidencia menor: ${m['tipo']} de ${m['minutos']} minutos para ${m['empleado']}',

    List<dynamic> lista =>
      'Múltiples incidencias a procesar: ${lista.length}',

    String texto =>
      'Comentarios adicionales: $texto',

    _ =>
      'Formato de reporte inválido',
  };

  print(resultadoIncidencia);
}