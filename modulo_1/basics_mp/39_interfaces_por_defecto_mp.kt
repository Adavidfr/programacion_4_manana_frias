interface EvaluacionDesempeno {
    fun evaluarPuntualidad(faltas: Int): String {
        return when {
            faltas == 0 -> "Sobresaliente (Sin faltas)"
            faltas in 1..2 -> "Satisfactorio"
            else -> "Necesita Mejorar"
        }
    }
    
    fun evaluarMetas(porcentajeCumplido: Double): String
}

class Supervisor(val nombre: String) : EvaluacionDesempeno {
    override fun evaluarMetas(porcentajeCumplido: Double): String {
        return if (porcentajeCumplido >= 90.0) "Metas Alcanzadas" else "Metas Insuficientes"
    }
}

fun main() {
    val supervisor = Supervisor("Ernesto")
    println("Supervisor: ${supervisor.nombre}")
    println("Evaluación puntualidad (1 falta): ${supervisor.evaluarPuntualidad(1)}")
    println("Evaluación metas (92%): ${supervisor.evaluarMetas(92.0)}")
}