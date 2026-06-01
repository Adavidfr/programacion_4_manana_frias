fun main() {
    println("Cálculo de Días de Vacaciones por Antigüedad")
    println("Ingrese los años laborados por el empleado:")
    val añosLaborados = readLine()?.toIntOrNull() ?: 0
    
    val diasVacaciones = when {
        añosLaborados < 1 -> 6
        añosLaborados in 1..2 -> 12
        añosLaborados in 3..5 -> 15
        añosLaborados in 6..10 -> 20
        añosLaborados > 10 -> 25
        else -> 0
    }
    println("Le corresponden $diasVacaciones días de vacaciones al año.")
}