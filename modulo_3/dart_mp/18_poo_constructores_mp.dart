class ExpedienteHR {
  final String idEmpleado;
  final String nombre;
  final double salarioBase;
  final bool   tieneSeguroSocial;

  // Constructor principal
  ExpedienteHR({
    required this.idEmpleado,
    required this.nombre,
    required this.salarioBase,
    this.tieneSeguroSocial = true,
  });

  // Constructor nombrado para practicantes/becarios
  ExpedienteHR.practicante({required this.nombre})
      : idEmpleado        = 'BEC-9999',
        salarioBase       = 500.0,
        tieneSeguroSocial = false;

  // Constructor nombrado para puestos corporativos estándar
  ExpedienteHR.corporativo({required this.idEmpleado, required this.nombre})
      : salarioBase       = 3500.0,
        tieneSeguroSocial = true;

  // Constructor factory para parsing de datos JSON o CSV de un empleado
  factory ExpedienteHR.desdeFichaUrl(String fichaString) {
    final uri = Uri.parse('http://empresa.com/?$fichaString');
    final id = uri.queryParameters['id'] ?? 'EMP-000';
    final nom = uri.queryParameters['nombre'] ?? 'Anonimo';
    final sal = double.tryParse(uri.queryParameters['salario'] ?? '') ?? 950.0;
    return ExpedienteHR(
      idEmpleado: id,
      nombre: nom,
      salarioBase: sal,
      tieneSeguroSocial: sal >= 1000.0,
    );
  }

  @override
  String toString() =>
      'Empleado: $nombre (ID: $idEmpleado) | Salario: \\$\${salarioBase.toStringAsFixed(2)} | SSN: ${tieneSeguroSocial ? "SI" : "NO"}';
}

void main() {
  final e1 = ExpedienteHR(idEmpleado: 'EMP-101', nombre: 'Carlos Ruiz', salarioBase: 1800.0);
  final e2 = ExpedienteHR.practicante(nombre: 'Sofía Castro');
  final e3 = ExpedienteHR.corporativo(idEmpleado: 'DIR-002', nombre: 'Diana Silva');
  final e4 = ExpedienteHR.desdeFichaUrl('id=EMP-405&nombre=BlancaEstela&salario=2900');

  print(e1);
  print(e2);
  print(e3);
  print(e4);
}