fun main() {
    var continuar = true
    var contadorCandidatos = 0
    
    println("=== Registro Continuo de Candidatos en Entrevista ===")
    while (continuar) {
        println("Ingrese el nombre del candidato a entrevistar (o escriba 'salir' para terminar):")
        val entrada = readLine() ?: ""
        if (entrada.equals("salir", ignoreCase = true)) {
            continuar = false
        } else {
            contadorCandidatos++
            println("Candidato #$contadorCandidatos registrado para entrevista: $entrada")
        }
    }
    println("Sesión de registro de candidatos finalizada. Total registrados: $contadorCandidatos")
}