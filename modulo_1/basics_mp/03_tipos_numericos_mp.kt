fun main() {
    // Tipos Datos en Recursos Humanos
    // ID de Empleado (Byte - hasta 127 en esta sucursal)
    val idSucursal: Byte = 127
    println("ID de Sucursal (Byte): $idSucursal")
    
    // Cantidad de Empleados en la Corporación
    val totalEmpleadosGlobal: Short = 32765
    println("Total Empleados (Short): $totalEmpleadosGlobal")
    
    // ID Único de Contratación
    val idContratacion: Int = 2147483647
    println("ID Único de Contratación (Int): $idContratacion")
    
    // Presupuesto Anual de RRHH
    val presupuestoAnual: Long = 12122122122123L
    println("Presupuesto Anual de RRHH (Long): $presupuestoAnual")
    
    println("Métricas decimales de Empleados")
    // Calificación de Desempeño Promedio
    val calificacionPromedio: Float = 4.8f
    println("Calificación de Desempeño (Float): $calificacionPromedio")
    
    // Salario Neto por Hora de Consultor
    val pagoHoraConsultor: Double = 125.7534
    println("Pago por Hora (Double): $pagoHoraConsultor")
    
    // Inferido
    val nombreEmpleado = "Juana Pérez"
    val edadEmpleado = 56
    
    println("Nombre Empleado: $nombreEmpleado")
    val nombreTipo = nombreEmpleado::class.simpleName
    println("Tipo inferido nombre: ${nombreTipo}")
    println("Edad Empleado: $edadEmpleado")
    val edadTipo = edadEmpleado::class.simpleName
    println("Tipo inferido edad: ${edadTipo}")
}