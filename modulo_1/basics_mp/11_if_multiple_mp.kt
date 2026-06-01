fun main() {
    println("Evaluación de Desempeño del Empleado")
    println("Ingrese la calificación de desempeño (1 a 10):")
    val calificacion = readLine()?.toIntOrNull() ?: 0
    
    if (calificacion >= 9) {
        println("Desempeño Excelente. Candidato a ascenso y bono máximo.")
    } else if (calificacion >= 7) {
        println("Desempeño Satisfactorio. Cumple con las metas.")
    } else if (calificacion >= 5) {
        println("Desempeño Regular. Requiere capacitación adicional.")
    } else {
        println("Desempeño Deficiente. Plan de mejora obligatorio o rescisión.")
    }
}