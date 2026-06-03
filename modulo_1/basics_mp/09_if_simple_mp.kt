fun main() {
    val asistenciaPorcentaje = 95
    var bonoPuntualidad = 0.0
    
    println("Evaluando asistencia del empleado...")
    
    // Condicional simple para bono
    if (asistenciaPorcentaje >= 95) {
        println("¡Felicidades! Asistencia sobresaliente.")
        bonoPuntualidad = 150.0
    }
    
    println("El bono asignado es de: $$bonoPuntualidad")
}