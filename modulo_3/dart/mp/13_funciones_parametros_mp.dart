void programarEntrevista({
  required String candidato,
  required int edad,
  bool exigePruebaTecnica = false,
  int rondas = 1,
}) {
  final tipo = exigePruebaTecnica ? 'evaluacion tecnica' : 'entrevista inicial';
  print('$candidato ($edad anos) agendo $tipo con $rondas ronda(s).');
}

double calcularIndiceDesempeno(double metasLogradas, double metasTotales, {bool redondear = false}) {
  final indice = (metasLogradas / metasTotales) * 100;
  return redondear ? double.parse(indice.toStringAsFixed(1)) : indice;
}

String mensajeBienvenidaRRHH(String nombre, {String puesto = 'Analista de RRHH'}) {
  return 'Hola $nombre, bienvenido al puesto de $puesto.';
}

void main() {
  programarEntrevista(
    candidato: 'Lucia',
    edad: 28,
    exigePruebaTecnica: true,
    rondas: 3,
  );

  print(calcularIndiceDesempeno(45.0, 50.0));
  print(calcularIndiceDesempeno(45.0, 50.0, redondear: true));

  print(mensajeBienvenidaRRHH('Carlos'));
  print(mensajeBienvenidaRRHH('Sofia', puesto: 'Gerente de Talentos'));
}