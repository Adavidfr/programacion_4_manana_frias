fun main() {
    println("Controles de Flujo de RRHH - Asignación de Roles")
    println("Escriba el código de departamento (1 a 6):")
    val codigo = readLine()?.toIntOrNull() ?: 0
    val departamento = when(codigo) {
        1 -> "Recursos Humanos"
        2 -> "Tecnología de la Información"
        3 -> "Finanzas y Contabilidad"
        4 -> "Operaciones y Logística"
        5 -> "Ventas y Mercadotecnia"
        6 -> "Atención al Cliente"
        else -> "Departamento no registrado en el organigrama"
    }
    println("Departamento asignado: $departamento")
}