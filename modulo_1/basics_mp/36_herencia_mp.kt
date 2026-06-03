open class Persona(val nombre: String, val edad: Int) {
    open fun mostrarInfo() {
        println("Nombre: $nombre | Edad: $edad")
    }
}

class EmpleadoContratado(
    nombre: String,
    edad: Int,
    val puesto: String,
    val salario: Double
) : Persona(nombre, edad) {
    
    override fun mostrarInfo() {
        super.mostrarInfo()
        println("Puesto: $puesto | Salario: $$salario")
    }
}

fun main() {
    val empleado = EmpleadoContratado("Mauricio", 35, "Líder Técnico", 4500.0)
    empleado.mostrarInfo()
}