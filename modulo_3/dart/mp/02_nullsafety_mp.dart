void main() {
  // Tipo no-nullable — NUNCA puede ser null
  String nombreEmpleado = 'Ana';
  // nombreEmpleado = null;       // ERROR de compilación

  // Tipo nullable — puede ser null (añadir ?)
  String? apellidoEmpleado = null;   // OK
  apellidoEmpleado = 'García';       // OK

  // Operadores de null safety
  String? departamentoAsignado;

  // ?. — safe call (igual que en Kotlin)
  print(departamentoAsignado?.length);      // null — no lanza excepción

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = departamentoAsignado ?? 'Sin departamento asignado';
  print(resultado);                         // Sin departamento asignado

  // ! — non-null assertion (igual que !! en Kotlin) — úsalo con precaución
  String departamentoSeguro = departamentoAsignado!;  // lanza si departamentoAsignado es null

  // Null check con if
  if (apellidoEmpleado != null) {
    print(apellidoEmpleado.length);   // smart cast — ya es String aquí
  }

  // late — inicialización diferida (como lateinit en Kotlin)
  late String codigoEmpleado;
  codigoEmpleado = 'EMP-2026-042';    // debe asignarse antes de usar
  print(codigoEmpleado);
}