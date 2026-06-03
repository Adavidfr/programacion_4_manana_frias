fun main() {
    val departamentoDisponible = true
    val diasSolicitados = 12
    val diasAcumulados = 15
    
    println("Procesando solicitud de vacaciones...")
    
    if (departamentoDisponible) {
        println("El departamento cuenta con cobertura para la fecha solicitada.")
        if (diasSolicitados <= diasAcumulados) {
            println("Aprobado: Tienes suficientes días de vacaciones acumulados ($diasAcumulados disponibles).")
        } else {
            println("Rechazado: Has solicitado $diasSolicitados días pero solo tienes $diasAcumulados.")
        }
    } else {
        println("Rechazado: El departamento no tiene suficiente personal de cobertura en este momento.")
    }
}