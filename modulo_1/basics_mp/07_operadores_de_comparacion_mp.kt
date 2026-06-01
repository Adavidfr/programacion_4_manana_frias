fun main() {
    val edadCandidato = 22
    val edadMinimaContratacion = 18
    val horasTrabajadasSemana = 45
    val limiteHorasExtra = 48
    
    // Comparaciones para Validación de Contratación y Jornada
    println("¿El candidato es mayor de edad para contratar? ${edadCandidato >= edadMinimaContratacion}")
    println("¿El candidato es menor de 18 años? ${edadCandidato < edadMinimaContratacion}")
    println("¿Las horas trabajadas superan el límite legal de 48 horas? ${horasTrabajadasSemana > limiteHorasExtra}")
    println("¿La jornada es exactamente el límite legal? ${horasTrabajadasSemana == limiteHorasExtra}")
    println("¿Las horas trabajadas son diferentes de 40? ${horasTrabajadasSemana != 40}")
}