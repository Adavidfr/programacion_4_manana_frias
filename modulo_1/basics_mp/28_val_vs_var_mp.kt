fun main() {
    // val: inmutable (el ID de empleado no cambia)
    val idEmpleado = "EMP-9081"
    
    // var: mutable (el puesto y salario pueden cambiar)
    var puesto = "Analista Junior"
    var salario = 1500.0
    
    println("Registro Inicial:")
    println("ID: $idEmpleado | Puesto: $puesto | Salario: $$salario")
    
    // idEmpleado = "EMP-9082" // ERROR: val no se puede reasignar
    
    puesto = "Analista Senior"
    salario = 2200.0
    println("Registro Actualizado:")
    println("ID: $idEmpleado | Puesto: $puesto | Salario: $$salario")
}