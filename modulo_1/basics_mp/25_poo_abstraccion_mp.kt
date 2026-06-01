// El usuario de esta clase solo sabe QUÉ puede hacer con un Empleado
// No necesita saber cómo se calcula el salarioNeto ni cómo funciona activo
class Empleado(
    val id:       Int,
    val nombre:   String,
    val salarioBruto: Double,
    private val diasTrabajados: Int      // privado — el usuario no manipula los días directamente
) {
    val salarioNeto: Double    // interfaz pública — qué puede consultar
        get() = salarioBruto * 0.92 // 8% de retención

    val activo: Boolean
        get() = diasTrabajados > 0

    override fun toString() = "Empleado: $nombre (Salario Neto: $${"%.2f".format(salarioNeto)})"
}

fun main() {
    val empleado = Empleado(1, "Ana Gómez", 2500.00, 20)

    // El código externo usa la interfaz pública — no sabe el detalle interno
    println("¿El empleado está activo? ${empleado.activo}")   // true
    println("Salario Neto: ${empleado.salarioNeto}")         // 2300.00
    // empleado.diasTrabajados = 0                           // ERROR — privado
}