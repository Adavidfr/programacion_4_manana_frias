open class Colaborador(val nombre: String, val salarioBase: Double) {
    open fun calcularBono(): Double {
        return salarioBase * 0.05 // 5% bono general
    }
}

class Desarrollador(nombre: String, salarioBase: Double) : Colaborador(nombre, salarioBase) {
    override fun calcularBono(): Double {
        return salarioBase * 0.10 // 10% bono técnico
    }
}

class Vendedor(nombre: String, salarioBase: Double, val ventasRealizadas: Int) : Colaborador(nombre, salarioBase) {
    override fun calcularBono(): Double {
        return salarioBase * 0.08 + (ventasRealizadas * 10.0) // 8% + comisión
    }
}

fun main() {
    val equipo: List<Colaborador> = listOf(
        Desarrollador("Laura", 3000.0),
        Vendedor("Daniel", 1500.0, 20),
        Colaborador("Jorge", 1200.0)
    )
    
    println("=== Reporte de Bonificaciones del Mes ===")
    for (miembro in equipo) {
        println("Colaborador: ${miembro.nombre} | Bono: $$${miembro.calcularBono()}")
    }
}