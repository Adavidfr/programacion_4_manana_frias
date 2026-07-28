abstract class EvaluacionLaboral {
  String get tipo;
  String analizar();

  void describir() {
    print('$tipo -> ${analizar()}');
  }
}

class EvaluacionProductividad extends EvaluacionLaboral {
  final double tareasCompletadas;
  final double tareasTotales;

  EvaluacionProductividad(this.tareasCompletadas, this.tareasTotales);

  @override
  String get tipo => 'Productividad';

  @override
  String analizar() {
    final porcentaje = (tareasCompletadas / tareasTotales) * 100;
    if (porcentaje >= 90) return 'Rendimiento Sobresaliente ($porcentaje%)';
    if (porcentaje >= 70) return 'Rendimiento Satisfactorio ($porcentaje%)';
    return 'Rendimiento Bajo ($porcentaje%)';
  }
}

class EvaluacionCompetencias extends EvaluacionLaboral {
  final int liderazgo;
  final int trabajoEquipo;
  final int comunicacion;

  EvaluacionCompetencias(this.liderazgo, this.trabajoEquipo, this.comunicacion);

  @override
  String get tipo => 'Competencias';

  @override
  String analizar() {
    return 'Liderazgo: $liderazgo/10, Trabajo en Equipo: $trabajoEquipo/10, Comunicación: $comunicacion/10';
  }
}

void main() {
  final evaluaciones = <EvaluacionLaboral>[
    EvaluacionProductividad(45.0, 50.0),
    EvaluacionCompetencias(8, 9, 7),
  ];

  for (final evaluacion in evaluaciones) {
    evaluacion.describir();
  }
}