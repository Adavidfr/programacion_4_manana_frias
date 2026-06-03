class Contrato(val empleadoId: Int, val puesto: String, val salario: Double) {
    var tipoContrato: String = "Temporal"

    // Constructor secundario
    constructor(empleadoId: Int, puesto: String, salario: Double, tipoContrato: String) : this(empleadoId, puesto, salario) {
        this.tipoContrato = tipoContrato
    }

    fun mostrarDetalles() {
        println("ID Empleado: $empleadoId | Puesto: $puesto | Salario: $$salario | Tipo: $tipoContrato")
    }
}

fun main() {
    val c1 = Contrato(101, "Diseñador UX", 1800.0)
    val c2 = Contrato(102, "Administrador de Redes", 2500.0, "Indefinido")
    
    c1.mostrarDetalles()
    c2.mostrarDetalles()
}