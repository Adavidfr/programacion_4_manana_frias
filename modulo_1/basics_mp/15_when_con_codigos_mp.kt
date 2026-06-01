fun main() {
    println("=== Menú de Operaciones de Recursos Humanos ===")
    println("1. Registrar nuevo empleado")
    println("2. Consultar salario neto")
    println("3. Solicitar periodo de vacaciones")
    println("4. Reportar incidencia o falta")
    println("Seleccione una opción: ")
    
    val opcion = readLine()?.toIntOrNull() ?: 0
    
    when (opcion) {
        1, 2 -> {
            println("Accediendo al Módulo de Registro y Nómina...")
            if (opcion == 1) {
                println(">> Cargando formulario de contratación...")
            } else {
                println(">> Calculando retenciones de ley y bono de antigüedad...")
            }
        }
        3 -> {
            println("Accediendo al Módulo de Ausencias y Licencias...")
            println(">> Validando días hábiles y cobertura departamental...")
        }
        4 -> {
            println("Accediendo al Módulo de Relaciones Laborales...")
            println(">> Registrando bitácora de incidencias...")
        }
        else -> println("Opción no válida en el sistema de RRHH.")
    }
}