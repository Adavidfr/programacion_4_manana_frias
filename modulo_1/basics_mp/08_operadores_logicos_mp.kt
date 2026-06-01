fun main() {
    val tieneTituloUniversitario = true
    val puntajePsicometricoAlto = false
    val tieneExperienciaPrevia = true
    
    // Evaluaciones de contratación de RRHH
    // Caso 1: Requiere título universitario Y puntaje psicométrico alto
    val elegibleParaPuestoA = tieneTituloUniversitario && puntajePsicometricoAlto
    println("Elegible para Puesto Senior A (Título Y Psicometría Alta): $elegibleParaPuestoA")
    
    // Caso 2: Requiere título universitario O experiencia previa comprobada
    val elegibleParaPuestoB = tieneTituloUniversitario || tieneExperienciaPrevia
    println("Elegible para Puesto B (Título O Experiencia): $elegibleParaPuestoB")
    
    // Caso 3: Negación de inactividad
    val empleadoActivo = true
    val cuentaSuspendida = !empleadoActivo
    println("¿La cuenta del empleado está suspendida? $cuentaSuspendida")
}