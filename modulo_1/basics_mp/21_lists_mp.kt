fun main() {
    println("Lista de Empleados en Oficina")

    val empleados = listOf("Ana", "Carlos", "Diana", "Carlos", "Esteban")

    println("Total de empleados: ${empleados.size}")
    println("Primer empleado contratado: ${empleados[0]}")
    println("Primer elemento de la lista: ${empleados.first()}")
    println("Último empleado contratado: ${empleados.last()}")

    println("Empleado en la posición 2: ${empleados.get(2)}")
    println("Primera aparición de 'Carlos': ${empleados.indexOf("Carlos")}")

    println("¿Se encuentra 'Diana' en la lista? ${empleados.contains("Diana")}")
    println("¿Está 'Carlos' en nómina? ${"Carlos" in empleados}")

    println("Sublista de inducción: ${empleados.subList(1, 3)}")
    println("Tomar los primeros 2 registrados: ${empleados.take(2)}")
    println("Excluir los primeros 3: ${empleados.drop(3)}")
    println("Tomar los últimos 2 registrados: ${empleados.takeLast(2)}")

    for (empleado in empleados) {
        println("Colaborador: $empleado")
    }

    println("\n--- Lista de Candidatos Mutables (Proceso Selección) ---")

    val candidatos = mutableListOf("Blanca", "Arturo", "Yaneth", "Rogelio")

    for (c in candidatos) {
        println("Candidato activo: $c")
    }

    candidatos.add("Victor")
    println(">> Agregado Victor:")
    for (c in candidatos) {
        println("Candidato activo: $c")
    }

    candidatos.add(0, "Mónica")
    println(">> Agregada Mónica al inicio:")
    for (c in candidatos) {
        println("Candidato activo: $c")
    }

    candidatos.remove("Victor")
    println(">> Retirado Victor del proceso:")
    for (c in candidatos) {
        println("Candidato activo: $c")
    }

    candidatos[1] = "Giselle" // Reemplazo de candidato en la posición 1
    println(">> Modificada posición 1 por Giselle:")
    for (c in candidatos) {
        println("Candidato activo: $c")
    }
    
    println("Uso de Deque para turnos de entrevista:")
    val colaEntrevistas = ArrayDeque<Int>()
    colaEntrevistas.addFirst(101) // Ticket 101
    colaEntrevistas.addLast(102)  // Ticket 102
    colaEntrevistas.addLast(103)  // Ticket 103
    println("Cola de entrevistas actual: $colaEntrevistas")
    colaEntrevistas.removeFirst() // Atendido primero
    println("Cola después de atender al primero: $colaEntrevistas")
    colaEntrevistas.removeLast()  // Se retira el último de la cola
    println("Cola final: $colaEntrevistas")
}