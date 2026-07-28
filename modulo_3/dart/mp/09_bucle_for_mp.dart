void main() {
  // for con índice — cuando necesitas el número de iteración
  for (int i = 0; i < 5; i++) {
    print('Procesando expediente del empleado #$i');
  }

  // for con paso distinto
  for (int i = 0; i <= 100; i += 25) {
    print('Progreso de capacitación de RRHH: $i%');
  }

  // for decreciente
  for (int i = 5; i >= 1; i--) {
    print('Días restantes para el cierre de nómina: $i');
  }
}