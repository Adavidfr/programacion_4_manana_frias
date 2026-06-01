data class PerfilEmpleado(
    val id: Int,
    val nombre: String,
    val departamento: String,
    val activo: Boolean = true
)

fun main() {
    val emp1 = PerfilEmpleado(1, "Clara Inés", "Recursos Humanos")
    val emp2 = emp1.copy(id = 2, nombre = "Marta Lucía") // Copy utility of data classes
    
    println("Perfil 1: $emp1")
    println("Perfil 2: $emp2")
    println("¿Tienen el mismo departamento? ${emp1.departamento == emp2.departamento}")
}