void main() {
  final nombre = 'Peter';
  final apellido = 'Parker';
  final edad = 28;

  // Interpolación
  print('Hola, $nombre $apellido');

  // Expresión
  print('${nombre.toUpperCase()} tendrá ${edad + 1} años el próximo año laboral');

  // String multilinea con triple comillas
  final ficha = '''
Nombre: $nombre $apellido
Edad:   $edad
Acceso: ${edad >= 18 ? 'Autorizado' : 'Denegado'}
  ''';
  print(ficha);

  // Raw string
  final rutaExpedientes = r'C:\RRHH\Expedientes\Nuevos';
  print(rutaExpedientes);

  // Métodos útiles de String en RRHH
  print('candidato'.toUpperCase());
  print('  Carlos Ruiz  '.trim());
  print('Recursos Humanos'.contains('Humanos'));
  print('Contrato Temporal'.replaceAll('Temporal', 'Indefinido'));
  print('Ana,Carlos,Diana'.split(','));
  print('Desarrollador'.substring(0, 4));
  print('Administrador'.startsWith('Admin'));
  print('105'.padLeft(6, '0'));
}