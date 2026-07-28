void main() {
  // var — tipo inferido (como val en Kotlin)
  var nombreEmpleado = 'Ana';           // String
  var edad           = 28;              // int
  var salarioBase    = 2500.50;         // double
  var activo         = true;            // bool

  // Tipo explícito
  String apellido = 'García';
  int    vacacionesDisponibles = 15;
  double tasaRetencion = 0.15;
  bool   esGerente     = false;

  // final — no se puede reasignar (como val en Kotlin)
  final departamento = 'Recursos Humanos';
  // departamento = 'Tecnología';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilación (como const en Kotlin)
  const salarioMinimoLegal = 1300.0;
  const horasJornadaSemanal = 40;

  // Diferencia clave: final vs const
  final fechaContratacion = DateTime.now();   // OK — se evalúa en runtime
  // const fechaContratacion = DateTime.now(); // ERROR — DateTime.now() no es constante de compilación

  print('$nombreEmpleado $apellido tiene $edad años en el departamento de $departamento');
  
  // var — mutable, tipo inferido
  var contadorProcesos = 0;
  contadorProcesos = 1;          // OK

  // final — inmutable referencia, evaluado en runtime
  final candidatos = ['Carlos', 'María', 'Luis'];
  candidatos.add('Sofia');       // OK — la referencia es final, no el contenido
  // candidatos = ['Pedro', 'Ana']; // ERROR — no se puede reasignar la referencia

  // const — inmutable profundo, evaluado en compilación
  const habilidadesRequeridas = ['Liderazgo', 'Trabajo en equipo'];
  // habilidadesRequeridas.add('Comunicación'); // ERROR — lista const es completamente inmutable
}
