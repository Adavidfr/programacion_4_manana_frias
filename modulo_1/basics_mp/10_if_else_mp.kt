fun main() {
    val edadEmpleado = 66
    val edadJubilacion = 65
    
    println("Verificando elegibilidad de jubilación del empleado...")
    
    if (edadEmpleado >= edadJubilacion) {
        println("El empleado cumple con la edad de jubilación.")
        println("Proceder a preparar los documentos de retiro.")
    } else {
        println("El empleado aún no califica para la jubilación.")
        val añosRestantes = edadJubilacion - edadEmpleado
        println("Faltan $añosRestantes años para la jubilación.")
    }
}