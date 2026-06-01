class GestorRRHH(val nombreEmpresa: String) {
    fun imprimirFicha(nombre: String, puesto: String) {
        println("--- Ficha de Colaborador ---")
        println("Empresa: $nombreEmpresa")
        println("Nombre: $nombre")
        println("Puesto: $puesto")
    }
}

fun main() {
    val gestor = GestorRRHH("Alpha Corp")
    gestor.imprimirFicha("Diana Silva", "Gerente de Proyectos")
}