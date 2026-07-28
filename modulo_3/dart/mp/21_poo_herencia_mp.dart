class Contrato {
  final String nombreEmpleado;
  final int duracionMeses;

  Contrato(this.nombreEmpleado, this.duracionMeses);

  String obtenerModalidad() => 'Definir modalidad';

  void mostrarPlan() {
    print('Empleado: $nombreEmpleado | Duracion: $duracionMeses meses | Modalidad: ${obtenerModalidad()}');
  }
}

class ContratoTiempoCompleto extends Contrato {
  ContratoTiempoCompleto(super.nombreEmpleado, super.duracionMeses);

  @override
  String obtenerModalidad() => 'Tiempo Completo (40h/semana)';

  void calcularBonoAnual() => print('Calculando bono anual para $nombreEmpleado');
}

class ContratoMedioTiempo extends Contrato {
  ContratoMedioTiempo(super.nombreEmpleado, super.duracionMeses);

  @override
  String obtenerModalidad() => 'Medio Tiempo (20h/semana)';

  void calcularHorasFlexibles() => print('Calculando horas flexibles para $nombreEmpleado');
}

void main() {
  final contratoFull = ContratoTiempoCompleto('Carlos Ruiz', 12);
  final contratoPart = ContratoMedioTiempo('Sofia Gomez', 6);

  contratoFull.mostrarPlan();
  contratoPart.mostrarPlan();

  contratoFull.calcularBonoAnual();
  contratoPart.calcularHorasFlexibles();
}