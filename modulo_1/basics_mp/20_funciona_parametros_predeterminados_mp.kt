fun registrarEmpleado(
    nombre: String,
    puesto: String = "Auxiliar General",
    salarioBase: Double = 1000.0
) {
    println("Empleado registrado -> Nombre: $nombre, Puesto: $puesto, Salario Base: $$salarioBase")
}

fun main() {
    println("=== Registro de Empleados con Valores Predeterminados ===")
    registrarEmpleado("Carlos Ruiz")
    registrarEmpleado("Lucía Fernández", "Gerente de Finanzas", 3500.0)
    registrarEmpleado("Mateo Torres", "Desarrollador Junior")
}