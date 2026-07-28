class PuestoTrabajo {
  String titulo;
  int salarioBase;

  PuestoTrabajo(this.titulo, this.salarioBase);

  int ajustarSalario(int aumento) {
    return salarioBase + aumento;
  }

  @override
  String toString() {
    return 'PuestoTrabajo(titulo: $titulo, salario base: $salarioBase)';
  }
}

void main() {
  final puesto = PuestoTrabajo('Analista de RRHH', 1800);
  print(puesto);
  print('Salario con aumento +200: \$${puesto.ajustarSalario(200)} USD');
}