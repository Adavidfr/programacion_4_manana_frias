class EmpleadoConValidacion(val nombre: String, val edad: Int) {
    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar en blanco" }
        require(edad >= 18) { "El empleado debe ser mayor de edad (18 años)" }
        println("Empleado $nombre validado y registrado exitosamente.")
    }
}

fun main() {
    try {
        val empValid = EmpleadoConValidacion("Blanca Estela", 25)
        val empInvalid = EmpleadoConValidacion("Juanito", 16)
    } catch (e: IllegalArgumentException) {
        println("Error de validación: ${e.message}")
    }
}