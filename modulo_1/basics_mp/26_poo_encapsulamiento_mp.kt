class ExpedienteEmpleado(
    val id: Int,
    val nombre: String,
    private var salarioBase: Double
) {
    // Getter personalizado
    val salario: Double
        get() = salarioBase

    // Setter controlado con validación
    fun actualizarSalario(nuevoSalario: Double) {
        if (nuevoSalario >= 950.0) { // Salario mínimo legal
            salarioBase = nuevoSalario
            println("Salario actualizado con éxito a $$salarioBase")
        } else {
            println("Error: El salario no puede ser inferior al mínimo legal ($950.0)")
        }
    }
}

fun main() {
    val expediente = ExpedienteEmpleado(101, "Carlos Ruiz", 1200.0)
    println("Empleado: ${expediente.nombre}, Salario: $$${expediente.salario}")
    
    // Intento de actualización inválida
    expediente.actualizarSalario(800.0)
    
    // Actualización válida
    expediente.actualizarSalario(1500.0)
    println("Nuevo Salario: $$${expediente.salario}")
}