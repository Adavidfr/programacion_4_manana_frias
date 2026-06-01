fun main() {
    // Registro de Salarios de Empleados
    val salarios = listOf(1200.0, 1500.0, 1800.0, 2200.0, 950.0)
    
    println("=== Lista de Salarios Registrados ===")
    for (salario in salarios) {
        println("Salario: $$salario")
    }
    
    println("\n=== Sumatoria de Nómina Mensual ===")
    var totalNomina = 0.0
    for (salario in salarios) {
        totalNomina += salario
    }
    println("Total de Nómina: $$totalNomina")
    
    println("\n=== Aplicación de Incremento del 5% ===")
    for (i in salarios.indices) {
        val nuevoSalario = salarios[i] * 1.05
        println("Empleado ${i + 1}: Antiguo: $${salarios[i]} -> Nuevo: $${"%.2f".format(nuevoSalario)}")
    }
    
    println("\n=== Rangos de Evaluación ===")
    for (evaluacion in 1..5) {
        println("Fase de Evaluación Anual #$evaluacion")
    }
}