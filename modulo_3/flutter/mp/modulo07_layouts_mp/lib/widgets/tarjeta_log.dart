import 'package:flutter/material.dart';

class TarjetaLog extends StatelessWidget {
  final String nivel;
  final String componente;
  final String mensaje;
  final DateTime timestamp;

  const TarjetaLog({
    super.key,
    required this.nivel,
    required this.componente,
    required this.mensaje,
    required this.timestamp,
  });

  Color get _colorNivel => switch (nivel.toUpperCase()) {
    'ERROR' => Colors.red.shade700,
    'WARN'  => Colors.orange.shade800,
    'INFO'  => Colors.blue.shade700,
    'DEBUG' => Colors.grey.shade600,
    _       => Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    final hora = '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: _colorNivel.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: _colorNivel),
                  ),
                  child: Text(
                    nivel,
                    style: TextStyle(
                      color: _colorNivel,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  componente,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                Text(
                  hora,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              mensaje,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}