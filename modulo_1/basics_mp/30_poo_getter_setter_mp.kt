class Colaborador(val nombre: String, val apellido: String) {
    // Getter personalizado para generar correo corporativo automático
    val correoCorporativo: String
        get() = "${nombre.lowercase()}.${apellido.lowercase()}@empresa.com"

    // Propiedad con getter y setter controlado
    var diasVacacionesDisponibles: Int = 15
        set(value) {
            if (value >= 0) {
                field = value
            } else {
                println("Error: Los días de vacaciones no pueden ser negativos.")
            }
        }
}

fun main() {
    val col = Colaborador("Roberto", "López")
    println("Correo del colaborador: ${col.correoCorporativo}")
    
    println("Vacaciones actuales: ${col.diasVacacionesDisponibles}")
    col.diasVacacionesDisponibles = 20
    println("Vacaciones actualizadas: ${col.diasVacacionesDisponibles}")
    
    col.diasVacacionesDisponibles = -5 // Intento inválido
    println("Vacaciones después de asignar negativo: ${col.diasVacacionesDisponibles}")
}