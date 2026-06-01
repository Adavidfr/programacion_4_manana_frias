void main() {
  // var — tipo inferido para datos de un empleado
  var nombreEmpleado = 'Ana Gómez';
  var edadEmpleado   = 28;
  var salarioBase    = 1200.50;
  var estaActivo     = true;

  // Tipo explícito
  String departamento = 'Recursos Humanos';
  int    horasTrabajadas = 40;
  double retencionImpuestos = 0.08;
  bool   tieneBono = false;

  // final — no se puede reasignar
  final sucursal = 'Sucursal Norte';

  // const — constante en tiempo de compilación
  const tasaBonoFijo = 150.0;

  // final vs const
  final fechaContratacion = DateTime.now();

  print('Colaborador $nombreEmpleado de $departamento tiene $edadEmpleado años y trabaja en $sucursal');
  
  // var — mutable
  var contadorRetardos = 0;
  contadorRetardos = 1;

  // final — inmutable referencia
  final habilidades = ['Liderazgo', 'Organización'];
  habilidades.add('Comunicación');

  // const — inmutable profundo
  const feriadosObligatorios = ['Navidad', 'Año Nuevo'];
}