abstract class EmpleadoBase(val nombre: String, val salarioPorHora: Double) {
    abstract fun calcularSueldo(horasTrabajadas: Int): Double
    
    fun mostrarFicha() {
        println("Colaborador: $nombre | Salario base/hora: $$salarioPorHora")
    }
}

class EmpleadoPlanta(nombre: String, salarioPorHora: Double) : EmpleadoBase(nombre, salarioPorHora) {
    override fun calcularSueldo(horasTrabajadas: Int): Double {
        val base = horasTrabajadas * salarioPorHora
        val horasExtra = if (horasTrabajadas > 40) horasTrabajadas - 40 else 0
        return base + (horasExtra * salarioPorHora * 0.5)
    }
}

class EmpleadoTemporal(nombre: String, salarioPorHora: Double) : EmpleadoBase(nombre, salarioPorHora) {
    override fun calcularSueldo(horasTrabajadas: Int): Double {
        return horasTrabajadas * salarioPorHora
    }
}

fun main() {
    val empPlanta = EmpleadoPlanta("Andrés", 20.0)
    val empTemporal = EmpleadoTemporal("Felipe", 15.0)
    
    empPlanta.mostrarFicha()
    println("Sueldo planta (45 hrs): $$${empPlanta.calcularSueldo(45)}")
    
    empTemporal.mostrarFicha()
    println("Sueldo temporal (45 hrs): $$${empTemporal.calcularSueldo(45)}")
}