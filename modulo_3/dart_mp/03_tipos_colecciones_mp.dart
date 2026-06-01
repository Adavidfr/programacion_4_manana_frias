void main() {
  // List — lista ordenada de empleados
  List<String> empleados = ['Ana Gómez', 'Luis Torres', 'María Rojas'];
  var idEmpleados = [101, 102, 103, 104, 105];

  print(empleados[0]);
  print(empleados.length);
  empleados.add('Carlos Vega');
  empleados.remove('Luis Torres');

  // Map — clave → valor de Salarios
  Map<String, double> salarios = {
    'Ana Gómez':   2500.0,
    'María Rojas': 1800.0,
  };

  print(salarios['Ana Gómez']);
  print(salarios['Pedro']);
  salarios['Carlos Vega'] = 1950.0;

  // Set — sin duplicados de departamentos autorizados
  Set<String> departamentos = {'Recursos Humanos', 'Sistemas', 'Operaciones'};
  departamentos.add('Sistemas');
  print(departamentos.length);

  // Spread operator
  var turnoManana = ['Ana', 'Carlos'];
  var turnoTarde  = ['Diana', 'Esteban'];
  var todosLosTurnos = [...turnoManana, ...turnoTarde];
  print(todosLosTurnos);

  // Collection if
  bool incluirConsultor = true;
  var nominaActiva = [
    'Ana Gómez (Planta)',
    'Carlos Vega (Planta)',
    if (incluirConsultor) 'Diana Silva (Consultor)',
  ];

  // Collection for
  var nuevosIds = [for (var i = 1; i <= 5; i++) 'EMP-${2026}${i}'];
  print(nuevosIds);
}