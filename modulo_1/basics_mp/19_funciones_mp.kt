// Función simple de RRHH
fun saludarColaborador(nombre: String) {
    println("Hola, bienvenido a la empresa, $nombre. ¡Mucho éxito hoy!")
}

// Función con retorno para calcular salario neto
fun calcularSalarioNeto(salarioBruto: Double, retenciones: Double): Double {
    return salarioBruto - retenciones
}

fun main() {
    saludarColaborador("Ana Gómez")
    val salarioBruto = 2500.0
    val impuestos = 300.0
    val neto = calcularSalarioNeto(salarioBruto, impuestos)
    println("El salario neto calculado del colaborador es: $$neto")
}