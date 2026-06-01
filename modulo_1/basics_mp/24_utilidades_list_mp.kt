fun main() {
    val salarios = listOf(1500.0, 2500.0, 1800.0, 3200.0, 950.0)
    
    println("--- Utilidades de Listas en Nómina ---")
    
    // Filtrar salarios altos (> 1800.0)
    val salariosAltos = salarios.filter { it > 1800.0 }
    println("Salarios mayores a $1800: $salariosAltos")
    
    // Sumar todos los salarios
    val nominaTotal = salarios.sum()
    println("Nómina total de la oficina: $$nominaTotal")
    
    // Salario promedio
    val salarioPromedio = salarios.average()
    println("Salario promedio: $$salarioPromedio")
    
    // Buscar el salario más alto
    val maxSalario = salarios.maxOrNull()
    println("Salario máximo: $$maxSalario")
    
    // Buscar el primer salario que cumpla una condición
    val primerSalarioBajo = salarios.find { it < 1000.0 }
    println("Primer salario menor a $1000: $$primerSalarioBajo")
}