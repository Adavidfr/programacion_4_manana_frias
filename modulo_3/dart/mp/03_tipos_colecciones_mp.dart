void main() {
  // List — lista ordenada (como List en Kotlin)
  List<String> departamentos = ['Recursos Humanos', 'Tecnología', 'Finanzas'];
  var          salariosBase  = [1500, 2500, 3200, 4000, 1800];       // tipo inferido: List<int>

  print(departamentos[0]);         // Recursos Humanos
  print(departamentos.length);     // 3
  departamentos.add('Marketing');
  departamentos.remove('Finanzas');

  // Map — clave → valor (como Map en Kotlin)
  Map<String, int> edadesEmpleados = {
    'Ana':   28,
    'Luis':  34,
    'María': 25,
  };

  print(edadesEmpleados['Ana']);     // 28
  print(edadesEmpleados['Pedro']);   // null — clave no existe
  edadesEmpleados['Carlos'] = 40;    // añadir

  // Set — sin duplicados (como Set en Kotlin)
  Set<String> habilidadesRequeridas = {'Liderazgo', 'Comunicación', 'Reclutamiento'};
  habilidadesRequeridas.add('Liderazgo');      // ignorado — ya existe
  print(habilidadesRequeridas.length);         // 3

  // Spread operator — para combinar colecciones
  var equipoDev = ['Carlos', 'Ana', 'Luis'];
  var equipoHR  = ['María', 'Sofia', 'Pedro'];
  var equipoCompleto = [...equipoDev, ...equipoHR];  // ['Carlos', 'Ana', 'Luis', 'María', 'Sofia', 'Pedro']
  print(equipoCompleto);

  // Collection if — elementos condicionales
  bool incluirBonoExtra = true;
  var beneficios = [
    'Seguro médico',
    'Capacitación continua',
    if (incluirBonoExtra) 'Bono de desempeño',  // solo si la condición es true
  ];

  // Collection for — generar elementos
  var bonosAntiguedad = [for (var anio = 1; anio <= 5; anio++) anio * 100];
  print(bonosAntiguedad);  // [100, 200, 300, 400, 500]
}