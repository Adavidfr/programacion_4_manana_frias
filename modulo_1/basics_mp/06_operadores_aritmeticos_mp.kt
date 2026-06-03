fun main() {
    // Cálculo de Nómina y Horas de Trabajo
    val horasSemanales = 40
    val pagoPorHora = 15.5
    val diasTrabajados = 5
    
    // Operaciones Básicas de RRHH
    val pagoBrutoSemanal = horasSemanales * pagoPorHora
    val deduccionImpuestos = pagoBrutoSemanal * 0.12
    val pagoNetoSemanal = pagoBrutoSemanal - deduccionImpuestos
    
    println("Pago Bruto Semanal: $$pagoBrutoSemanal")
    println("Deducción de Impuestos (12%): $$deduccionImpuestos")
    println("Pago Neto Semanal: $$pagoNetoSemanal")
    
    val diasVacacionesDisponibles = 15
    val diasVacacionesTomados = 3
    val diasVacacionesRestantes = diasVacacionesDisponibles - diasVacacionesTomados
    println("Días de vacaciones restantes: $diasVacacionesRestantes")
    
    // División de Carga Laboral
    val totalTareas = 27
    val tareasPorEmpleado = totalTareas / 5
    val tareasRestantes = totalTareas % 5
    println("Tareas por empleado (5 empleados): $tareasPorEmpleado")
    println("Tareas restantes/extras: $tareasRestantes")
    
    // Incremento de Días de Experiencia
    var añosExperiencia = 3
    añosExperiencia++
    println("Años de experiencia incrementados: $añosExperiencia")
    
    // Asignación Compuesta en Bonos
    var bonoTotal = 100.0
    bonoTotal += 50.0 // Bono de puntualidad
    bonoTotal *= 1.10 // Incremento del 10% por productividad
    println("Bono Total Acumulado: $$bonoTotal")
}