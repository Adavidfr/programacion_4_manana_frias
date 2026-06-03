enum class TipoContrato(val descripcion: String) {
    TIEMPO_COMPLETO("Jornada Completa de 40 horas"),
    MEDIO_TIEMPO("Media Jornada de 20 horas"),
    HONORARIOS("Por Honorarios / Freelance")
}

fun main() {
    val contratoActual = TipoContrato.TIEMPO_COMPLETO
    println("Detalles del Contrato: ${contratoActual.name} - ${contratoActual.descripcion}")
    
    println("Tipos de Contratos disponibles:")
    for (tipo in TipoContrato.values()) {
        println("- ${tipo.name}: ${tipo.descripcion}")
    }
}