void main() {
  // Conversiones numéricas
  int    horasTrabajadas = 40;
  double horasDecimal    = horasTrabajadas.toDouble();   // 40.0
  String horasTexto      = horasTrabajadas.toString();   // "40"

  // String → número
  int    diasHabiles  = int.parse('160');         // 160 horas mensuales
  double salarioBase  = double.parse('2500.50');  // 2500.50

  // Conversión segura (no lanza excepción)
  int?    codigoInvalido  = int.tryParse('abc');   // null
  double? bonoRendimiento = double.tryParse('99'); // 99.0

  // Verificar tipo con is (como en Kotlin)
  Object datosEmpleado = 'Contrato Indefinido';
  if (datosEmpleado is String) {
    print(datosEmpleado.length);  // smart cast — ya es String
  }

  // Cast explícito con as
  Object obj = 'Departamento de RRHH';
  String departamento = obj as String;
  print(departamento);

  // Comprobar nulabilidad
  String? observacionDesempeno = null;
  int longitud = observacionDesempeno?.length ?? 0;
  print(longitud);  // 0

  // Números especiales
  print(double.infinity);     // Infinity
  print(double.nan);          // NaN
  print(double.maxFinite);    // 1.7976931348623157e+308
}