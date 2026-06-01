// Clase base Persona
class MiembroCorporativo {
  final String nombre;
  final int    aniosServicio;

  MiembroCorporativo(this.nombre, this.aniosServicio);

  String describirPuesto() => 'Personal General';

  void presentarse() {
    print('Colaborador: $nombre, Años de servicio: $aniosServicio. Puesto: \${describirPuesto()}');
  }
}

// HERENCIA: Programador y Director especializan a MiembroCorporativo
class Programador extends MiembroCorporativo {
  Programador(super.nombre, super.aniosServicio);

  @override
  String describirPuesto() => 'Desarrollador de Software';

  void programar() => print('$nombre está escribiendo código Kotlin/Dart 💻');
}

class Director extends MiembroCorporativo {
  Director(super.nombre, super.aniosServicio);

  @override
  String describirPuesto() => 'Director de Departamento';

  void planificarTrimestre() => print('$nombre está planificando las metas de RRHH 📅');
}

void main() {
  final dev = Programador('Marcos', 3);
  final dir = Director('Diana', 8);

  dev.presentarse();
  dir.presentarse();

  dev.programar();
  dir.planificarTrimestre();
}