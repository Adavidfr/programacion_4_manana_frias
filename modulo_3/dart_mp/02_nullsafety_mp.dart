void main() {
  // Tipo no-nullable
  String puesto = 'Gerente de Proyectos';

  // Tipo nullable
  String? segundoApellido = null;
  segundoApellido = 'Rodríguez';

  // Operadores de null safety
  String? correoContacto;

  // ?. — safe call
  print(correoContacto?.length);

  // ?? — operador Elvis
  String correoFinal = correoContacto ?? 'sin-correo@empresa.com';
  print(correoFinal);

  // Null check con if
  if (segundoApellido != null) {
    print(segundoApellido.length);
  }

  // late — inicialización diferida
  late String codigoBiometrico;
  codigoBiometrico = 'BIO-89012';
  print(codigoBiometrico);
}