void main() {
  final nombreEmpleado = 'Ana';
  final edad           = 28;

  // Interpolación con $ (igual que en Kotlin)
  print('Empleado: $nombreEmpleado');                    // Empleado: Ana

  // Expresión con ${ }
  print('${nombreEmpleado.toUpperCase()} cumple ${edad + 1} años el próximo mes');

  // String multilinea con triple comillas
  final fichaEmpleado = '''
Nombre: $nombreEmpleado
Edad:   $edad
Estado: ${edad >= 18 ? 'Contratable' : 'Menor de edad'}
  ''';
  print(fichaEmpleado);

  // Raw string — ignora el escape y la interpolación
  final rutaExpediente = r'C:\RRHH\Expedientes\Ana';  // el \ no se interpreta
  print(rutaExpediente);

  // Concatenación (menos idiomático — preferir interpolación)
  final saludo = 'Bienvenido, ' + nombreEmpleado + '!';
  print(saludo);

  // Métodos útiles de String
  print('recursos humanos'.toUpperCase());           // RECURSOS HUMANOS
  print('  Recursos Humanos  '.trim());              // Recursos Humanos
  print('Contratación'.contains('trata'));           // true
  print('Seleccion'.replaceAll('c', 'C'));            // SeleCCion
  print('Analista,Gerente,Reclutador'.split(','));   // [Analista, Gerente, Reclutador]
  print('Desarrollador'.substring(0, 7));            // Desarro
  print('Capacitación'.startsWith('Capa'));          // true
  print('42'.padLeft(5, '0'));                       // 00042
  print('EMP'.padRight(6, '0'));                     // EMP000

  // Manejo de nulabilidad en Strings
  String? nombreCandidato;

  // Sin verificar — error de compilación
  // print(nombreCandidato.length);  // ERROR: nombreCandidato puede ser null

  // Forma 1 — verificación explícita
  if (nombreCandidato != null) {
    print(nombreCandidato.length);  // aquí Dart sabe que nombreCandidato es String
  }

  // Forma 2 — operador ?.
  print(nombreCandidato?.length);  // null, sin excepción

  // Forma 3 — valor por defecto
  int longitud = nombreCandidato?.length ?? 0;
  print(longitud);  // 0
}