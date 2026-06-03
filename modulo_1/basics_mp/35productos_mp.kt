data class Departamento(val id: Int, val nombre: String)

data class Empleado(
    val id:           Int,
    val nombre:       String,
    val salarioBruto: Double,
    val diasAsistidos:Int,
    val departamento: Departamento,
    val activo:       Boolean = true
) {
    val elegibleParaBono: Boolean get() = activo && diasAsistidos >= 20
    val salarioNeto: Double get() = salarioBruto * 0.92

    fun aplicarBonoAntiguedad(porcentaje: Double): Empleado {
        require(porcentaje in 0.0..100.0) { "El porcentaje debe estar entre 0 y 100" }
        return copy(salarioBruto = salarioBruto * (1 + porcentaje / 100))
    }
}

object ControlEmpleados {
    private val departamentos = mutableListOf(
        Departamento(1, "Recursos Humanos"),
        Departamento(2, "Desarrollo de Software"),
        Departamento(3, "Operaciones")
    )
    private val empleados   = mutableListOf<Empleado>()
    private var siguienteId = 1

    fun registrarEmpleado(nombre: String, salarioBruto: Double, diasAsistidos: Int, deptoId: Int): Empleado? {
        val depto = departamentos.find { it.id == deptoId } ?: return null
        val emp  = Empleado(siguienteId++, nombre, salarioBruto, diasAsistidos, depto)
        empleados.add(emp)
        return emp
    }

    fun listar(): List<Empleado>              = empleados.toList()
    fun aptosParaBono(): List<Empleado>       = empleados.filter { it.elegibleParaBono }
    fun porDepartamento(id: Int): List<Empleado> = empleados.filter { it.departamento.id == id }
    fun buscar(query: String): List<Empleado> =
        empleados.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    ControlEmpleados.registrarEmpleado("Ana Gómez", 2500.0, 22, 1)
    ControlEmpleados.registrarEmpleado("Carlos Ruiz", 1800.0, 15, 2)
    ControlEmpleados.registrarEmpleado("Diana Silva", 3200.0, 20, 2)
    ControlEmpleados.registrarEmpleado("Esteban Vega", 1500.0, 25, 3)

    println("=== Directorio Completo de Personal ===")
    ControlEmpleados.listar().forEach { e ->
        val bonoStatus = if (e.elegibleParaBono) "⭐" else "❌"
        println("$bonoStatus ${e.nombre} — Salario Neto: $$${"%.2f".format(e.salarioNeto)} (${e.departamento.nombre})")
    }

    println("\n=== Empleados Aptos para Bono con 5% de Aumento ===")
    ControlEmpleados.aptosParaBono()
        .map { it.aplicarBonoAntiguedad(5.0) }
        .forEach { println("  ${it.nombre}: Nuevo Salario Bruto: $$${"%.2f".format(it.salarioBruto)}") }
}