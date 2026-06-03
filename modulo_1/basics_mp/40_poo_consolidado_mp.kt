sealed class NotificacionRRHH(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String

    data class EmailBienvenida(
        val correoDestinatario: String,
        val nombreEmpleado:       String
    ) : NotificacionRRHH("Bienvenido a bordo", "Nos alegra tenerte en el equipo, $nombreEmpleado.") {
        override fun formatear() =
            "📧 Email de RRHH → $correoDestinatario\n   Asunto: $titulo\n   Cuerpo: $mensaje"
    }

    data class AlertaAsistencia(val dispositivoId: String, val hora: String)
        : NotificacionRRHH("Registro de Asistencia", "Entrada registrada a las $hora") {
        override fun formatear() = "🔔 Alerta Biométrica → Dispositivo $dispositivoId: $titulo [$hora]"
    }

    data class SmsPago(val celular: String, val monto: Double)
        : NotificacionRRHH("Recibo de Nómina", "Tu salario de $$monto ha sido depositado.") {
        override fun formatear() = "📱 SMS de Nómina → $celular: $mensaje"
    }
}

interface CanalEnvioRRHH {
    val nombreCanal: String
    fun despachar(n: NotificacionRRHH): Boolean
}

class CanalEmail : CanalEnvioRRHH {
    override val nombreCanal = "Email Corporativo"
    override fun despachar(n: NotificacionRRHH): Boolean {
        if (n !is NotificacionRRHH.EmailBienvenida) return false
        println("  [EMAIL RRHH] Despachando a: ${n.correoDestinatario}")
        return true
    }
}

class CanalBiometrico : CanalEnvioRRHH {
    override val nombreCanal = "Terminal de Entrada"
    override fun despachar(n: NotificacionRRHH): Boolean {
        if (n !is NotificacionRRHH.AlertaAsistencia) return false
        println("  [BIOMÉTRICO RRHH] Sincronizando marcación en: ${n.dispositivoId}")
        return true
    }
}

class DespachadorRRHH(private val canales: List<CanalEnvioRRHH>) {
    fun enviarAlerta(alerta: NotificacionRRHH) {
        println(alerta.formatear())
        val exito = canales.any { it.despachar(alerta) }
        if (!exito) println("  ⚠️ Canal no configurado para este tipo de notificación")
        println()
    }
}

fun main() {
    val despachador = DespachadorRRHH(listOf(CanalEmail(), CanalBiometrico()))

    listOf(
        NotificacionRRHH.EmailBienvenida("ana.gomez@empresa.com", "Ana Gómez"),
        NotificacionRRHH.AlertaAsistencia("LECTOR-SUR-01", "08:00 AM"),
        NotificacionRRHH.SmsPago("+34600000000", 2300.0)
    ).forEach { despachador.enviarAlerta(it) }
}