void main() {
  String codigoDepartamento = '404';

  switch (codigoDepartamento) {
    case '101':
      print('Recursos Humanos');
    case '102':
      print('Tecnología');
    case '201':
      print('Finanzas');
    case '301':
      print('Ventas');
    case '404':
      print('Departamento no encontrado');
    case '500':
      print('Error del sistema de RRHH');
    default:
      print('Código desconocido');
  }

  // Switch expresión — asigna el resultado a una variable
  String codigoPuesto = '404';

  String descripcionPuesto = switch (codigoPuesto) {
    '101' => 'HR-01 — Reclutador Senior',
    '102' => 'TECH-01 — Desarrollador Software',
    '103' => 'TECH-02 — Administrador de Sistemas',
    '201' => 'FIN-01 — Contador General',
    '202' => 'FIN-02 — Analista Financiero',
    '301' => 'MKT-01 — Especialista en Marketing',
    '404' => 'Puesto no encontrado — vacante sin asignar',
    '500' => 'Error de servidor de datos',
    '503' => 'Módulo de contratación no disponible',
    _     => 'Código de puesto desconocido',  // _ es el caso por defecto
  };

  print(descripcionPuesto);  // Puesto no encontrado — vacante sin asignar

  int codigoNivel = 404;

  // Múltiples valores en una rama con ||
  String categoriaLaboral = switch (codigoNivel) {
    101 || 102 || 104       => 'Nivel Operativo (1xx)',
    201 || 202 || 207       => 'Nivel Técnico / Supervisión (2xx)',
    301 || 302 || 303 || 304 => 'Nivel Gerencial / Directivo (3xx)',
    400 || 401 || 403       => 'Contratista / Temporal (4xx)',
    _                       => 'Categoría Desconocida',
  };

  print(categoriaLaboral);  // Contratista / Temporal (4xx)

  // Guards — condición adicional con 'when'
  double salarioBase = 3900.0;

  String nivelSalarial = switch (salarioBase) {
    double s when s >= 5000.0 => '🚨 DIRECTIVO — aprobación de junta requerida',
    double s when s >= 3500.0 => '🔴 SENIOR — banda salarial alta',
    double s when s >= 2000.0 => '🟡 SEMISENIOR — banda salarial media',
    double s when s >= 1300.0 => '🟢 JUNIOR — salario base legal',
    _                         => '🔵 BAJO — requiere revisión de salario mínimo',
  };

  print(nivelSalarial);  // 🔴 SENIOR — banda salarial alta

  // switch puede verificar el TIPO del valor
  Object respuestaSistemaRRHH = {'id': 101, 'nombre': 'Carlos Ruiz', 'salario': 2800.00};

  String resultado = switch (respuestaSistemaRRHH) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error de RRHH: ${m['error']}',
    Map<String, dynamic> m =>
        'Empleado: ${m['nombre']} — \$${m['salario']}',
    List<dynamic> lista =>
        '${lista.length} postulantes en el proceso de selección',
    String texto =>
        'Informe de RRHH: $texto',
    _ =>
        'Respuesta del sistema desconocida',
  };

  print(resultado);  // Empleado: Carlos Ruiz — $2800.0
}
