class ColaboradorHR {
  // 1. Propiedades
  final String id;
  final String nombre;
  String       puesto;
  bool         _activo = false;

  // 2. Constructor
  ColaboradorHR({
    required this.id,
    required this.nombre,
    required this.puesto,
  });

  // 3. Getter — propiedad de estado de contratación
  bool   get activo => _activo;
  String get estado => _activo ? 'vigente' : 'suspendido';

  // 4. Setter — controlar estado de contrato
  set estadoContratacion(bool valor) {
    _activo = valor;
    print('Contrato de $nombre: ${valor ? "ACTIVADO" : "DE BAJA/RESCINDIDO"}');
  }

  // 5. Métodos
  void iniciarLabores() {
    _activo = true;
    print('$nombre ha marcado ingreso al turno como $puesto.');
  }

  void terminarLabores() {
    _activo = false;
    print('$nombre ha marcado salida del turno.');
  }

  String resumenFicha() => 'ID: $id | Nombre: $nombre | Puesto: $puesto | Estado: $estado';

  // 6. toString
  @override
  String toString() => 'ColaboradorHR($nombre, $puesto, $estado)';
}

void main() {
  // Crear una instancia de un empleado
  final colaborador = ColaboradorHR(
    id:     'EMP-9081',
    nombre: 'Ana Gómez',
    puesto: 'Analista de Software',
  );

  // Usar sus métodos
  colaborador.iniciarLabores();
  print(colaborador.estado);
  print(colaborador.resumenFicha());
  print(colaborador);

  colaborador.estadoContratacion = false;
  print(colaborador.activo);
}