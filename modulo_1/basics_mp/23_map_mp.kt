fun main() {
    println("=== Directorio Telefónico del Personal (Map) ===")
    // Map inmutable
    val extensiones = mapOf(101 to "Recursos Humanos", 102 to "Sistemas", 103 to "Contabilidad")
    println("Directorio de extensiones: $extensiones")
    println("Extension del ID 101: ${extensiones[101]}")
    
    // Map mutable de Empleados por ID
    val directorioEmpleados = mutableMapOf(
        "EMP001" to "Ana Gómez",
        "EMP002" to "Carlos Ruiz"
    )
    println("Directorio inicial: $directorioEmpleados")
    
    // Agregar empleado
    directorioEmpleados["EMP003"] = "Diana Silva"
    // Actualizar datos
    directorioEmpleados["EMP001"] = "Ana María Gómez"
    
    println("Directorio actualizado: $directorioEmpleados")
    
    // Eliminar empleado
    directorioEmpleados.remove("EMP002")
    println("Directorio final: $directorioEmpleados")
}