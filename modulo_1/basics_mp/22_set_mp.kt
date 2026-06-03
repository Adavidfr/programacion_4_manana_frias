fun main() {
    println("=== Control de ID Únicos de Empleados (Set) ===")
    // Set inmutable
    val idUnicos = setOf(101, 102, 103, 101, 104)
    println("IDs únicos registrados: $idUnicos")
    println("¿El ID 102 está registrado? ${idUnicos.contains(102)}")
    
    // Set mutable para accesos biométricos autorizados
    val accesosAutorizados = mutableSetOf("Ana Gómez", "Carlos Ruiz", "Diana Silva")
    println("Accesos autorizados iniciales: $accesosAutorizados")
    
    accesosAutorizados.add("Esteban Vega")
    accesosAutorizados.add("Ana Gómez") // Intento de duplicado
    println("Accesos autorizados actualizados: $accesosAutorizados")
    
    accesosAutorizados.remove("Carlos Ruiz")
    println("Accesos después de revocar a Carlos: $accesosAutorizados")
}