fun main() {
    // No Mutable
    val nombreEmpleado = "Ana Gómez"
    val edadEmpleado: Int = 28
    val salarioBase = 1200.50
    
    // Mutables
    var diasTrabajados = 0
    diasTrabajados = diasTrabajados + 1
    println("Días trabajados: $diasTrabajados")
    diasTrabajados = diasTrabajados - 1
    println("Días trabajados: $diasTrabajados")
    
    println("$nombreEmpleado tiene $edadEmpleado años y un salario de $$salarioBase")
}