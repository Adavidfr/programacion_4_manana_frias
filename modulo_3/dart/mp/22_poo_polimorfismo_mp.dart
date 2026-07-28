abstract class BeneficioLaboral {
  String get nombre;
  double calcularMonto();
}

class BeneficioSeguroMedico extends BeneficioLaboral {
  final double tarifaBase;
  BeneficioSeguroMedico(this.tarifaBase);

  @override
  String get nombre => 'Seguro Médico';

  @override
  double calcularMonto() => tarifaBase * 1.2;
}

class BeneficioBonoProductividad extends BeneficioLaboral {
  final double unidades;
  BeneficioBonoProductividad(this.unidades);

  @override
  String get nombre => 'Bono de Productividad';

  @override
  double calcularMonto() => unidades * 50;
}

class BeneficioCapacitacion extends BeneficioLaboral {
  final double horas;
  BeneficioCapacitacion(this.horas);

  @override
  String get nombre => 'Capacitación Profesional';

  @override
  double calcularMonto() => horas * 25;
}

void imprimirBeneficio(BeneficioLaboral beneficio) {
  print('${beneficio.nombre}: \$${beneficio.calcularMonto().toStringAsFixed(1)} USD');
}

void main() {
  final beneficios = <BeneficioLaboral>[
    BeneficioSeguroMedico(300),
    BeneficioBonoProductividad(10),
    BeneficioCapacitacion(20),
  ];

  for (final beneficio in beneficios) {
    imprimirBeneficio(beneficio);
  }

  final mayorBeneficio = beneficios.reduce((a, b) => a.calcularMonto() > b.calcularMonto() ? a : b);
  print('\nBeneficio con mayor inversión: ${mayorBeneficio.nombre}');
}