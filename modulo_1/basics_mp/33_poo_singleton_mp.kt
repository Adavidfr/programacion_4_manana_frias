object RegistroEmpleados {
    private val listaEmpleados = mutableListOf<String>()

    fun contratarEmpleado(nombre: String) {
        listaEmpleados.add(nombre)
        println("$nombre ha sido contratado(a).")
    }

    fun listarPersonal() {
        println("=== Lista de Personal Activo ===")
        listaEmpleados.forEach { println("- $it") }
    }
}

fun main() {
    RegistroEmpleados.contratarEmpleado("Sofía Castro")
    RegistroEmpleados.contratarEmpleado("Andrés Cepeda")
    RegistroEmpleados.listarPersonal()
}