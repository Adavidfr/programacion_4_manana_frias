class FondoNomina {
  double _presupuestoTotal;

  FondoNomina(this._presupuestoTotal);

  double get presupuestoTotal => _presupuestoTotal;

  void registrarPagoNomina(double monto) {
    if (monto <= 0) {
      print('El monto debe ser mayor a 0');
      return;
    }
    if (monto > _presupuestoTotal) {
      print('No hay suficiente presupuesto registrado en la nómina');
      return;
    }
    _presupuestoTotal -= monto;
    print('Pago de nómina ejecutado: \$${monto.toStringAsFixed(0)} USD');
  }

  void reintegrarFondo(double monto) {
    if (monto <= 0) {
      print('El monto debe ser mayor a 0');
      return;
    }
    _presupuestoTotal += monto;
    print('Reintegro asignado al fondo: \$${monto.toStringAsFixed(0)} USD');
  }
}

void main() {
  final nomina = FondoNomina(12000.0);

  nomina.registrarPagoNomina(4500.0);
  nomina.reintegrarFondo(2000.0);
  print('Presupuesto total disponible en nómina: \$${nomina.presupuestoTotal.toStringAsFixed(0)} USD');
}