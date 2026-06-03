void main() {
  // Conversiones numéricas en RRHH
  int    entero  = 42;
  double decimal = entero.toDouble();
  String texto   = entero.toString();

  // String → número (ej. lectura de nómina o edad de consola)
  int    edad = int.parse('28');
  double salario = double.parse('1500.50');

  // Conversión segura
  int?    diasFalta = int.tryParse('ninguno');
  double? bonoExtra = double.tryParse('100');

  // Verificar tipo con is
  Object valor = 'Asistente de Dirección';
  if (valor is String) {
    print(valor.length);
  }

  // Cast explícito con as
  Object obj = 'Contrato Indefinido';
  String str = obj as String;

  // Comprobar nulabilidad
  String? supervisor = null;
  int longSupervisor = supervisor?.length ?? 0;
  print(longSupervisor);

  // Números especiales
  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}