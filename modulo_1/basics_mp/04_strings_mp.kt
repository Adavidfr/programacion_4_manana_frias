fun main() {
    val nombre = "Peter"
    val apellido = "Parker"
    val edad = 28
    
    // Variable simple - Saludo de Bienvenida
    println("Bienvenido al portal de RRHH, $nombre")
    // Expresión
    println("Nombre Completo del Empleado: ${nombre.uppercase()} ${apellido.uppercase()}")
    println("Edad del Empleado en 6 años: ${edad+6} años")
    
    // String Multilínea - Ficha del Empleado
    val credencialEmpleado = """
    	|Ficha de Identificación de Empleado
    	|Nombre: $nombre $apellido
        |Edad: $edad
        |Acceso a Oficinas: ${if(edad >= 18) "Autorizado" else "Restringido"}
    """.trimMargin()
    println(credencialEmpleado)
}