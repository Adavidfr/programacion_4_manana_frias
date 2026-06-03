void main() {
  // for con índice — simulación de turnos de entrevista
  for (int i = 1; i <= 5; i++) {
    print('Entrevista del Candidato #\$i finalizada');
  }

  // for con paso distinto — porcentaje de inducción completada
  for (int i = 0; i <= 100; i += 25) {
    print('Progreso del curso de inducción: \$i%');
  }

  // for decreciente — días hábiles restantes para el fin de mes laboral
  for (int i = 5; i >= 1; i--) {
    print('Días laborados restantes para nómina: \$i');
  }
}