void main() {
  // Forma básica
  int horasTrabajadas = 48;

  if (horasTrabajadas > 45) {
    print('Sobrecarga laboral');
  } else if (horasTrabajadas >= 40) {
    print('Jornada normal');
  } else {
    print('Jornada parcial');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String estado = horasTrabajadas > 45 ? 'Con sobrecarga' : 'Sin sobrecarga';
  print(estado);

  // null-aware con ternario
  String? departamento;
  String display = departamento != null ? departamento.toUpperCase() : 'Sin departamento';

  // Forma más concisa con Elvis
  String display2 = departamento?.toUpperCase() ?? 'Sin departamento';
  print(display2);  // Sin departamento
}