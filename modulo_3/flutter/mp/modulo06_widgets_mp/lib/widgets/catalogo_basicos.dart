import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos — Control de RRHH')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico con sombra y underline ───────────────────────────────
          const Text(
            'Carlos Ruiz — Analista RRHH: Activo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Alineación y desbordamiento ──────────────────────────────────────
          const SizedBox(
            width: 250,
            child: Text(
              'Dirección de Recursos Humanos y Gestión Integral del Talento Humano en la organización',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),

          const SizedBox(height: 16),

          // ── Text.rich con lineThrough ────────────────────────────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado laboral: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'EN REVISIÓN',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: ' — evaluación aprobada hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Texto largo justificado y sin salto de línea ────────────────────
          const Text(
            'Este es un texto informativo para observar cómo se presenta el perfil del empleado dentro del módulo de Recursos Humanos. La organización garantiza la correcta administración del talento y cumplimiento de metas.',
            textAlign: TextAlign.justify,
            softWrap: false,
          ),

          const SizedBox(height: 16),

          // ── SelectableText ───────────────────────────────────────────────────
          const SelectableText(
            'EMP-2026-042-RRHH',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),

          const Divider(height: 32),

          // ── Íconos de estado ──────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'Empleado activo',
                child: Icon(
                  Icons.check_circle_outline,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Icon(Icons.cancel, size: 40, color: Colors.red),
              const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              const Icon(Icons.badge, size: 40, color: Colors.indigo),
              const Icon(Icons.person_off, size: 40, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 8),

          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración de RRHH',
          ),

          const Divider(height: 32),

          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(onPressed: null, child: const Text('Desactivado')),
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar expediente'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.pause, size: 18),
                label: const Text('Suspender turno'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 12,
              minimumSize: const Size(
                double.infinity,
                0,
              ),
            ),
            child: const Text(
              'Dar de baja expediente',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.badge, color: Colors.indigo),
              title: const Text('Carlos Ruiz'),
              subtitle: const Text('Analista RRHH · Departamento Talento'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade50,
                child: const Icon(Icons.person_off, color: Colors.red, size: 20),
              ),
              title: const Text('Ana García'),
              subtitle: const Text('Licencia médica · Departamento Finanzas'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
            ),
          ),
          const Divider(height: 32),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('RRHH')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Activo'),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('Capacitado'),
                selected: false,
                onSelected: (_) {},
              ),
              ActionChip(
                label: const Text('Ver expediente'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
              const Chip(
                label: Text('Nómina'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
              ),
              const Chip(
                label: Text('Asistencia'),
                backgroundColor: Colors.teal,
                labelStyle: TextStyle(color: Colors.white),
              ),
              const Chip(
                label: Text('Evaluación'),
                backgroundColor: Colors.amber,
              ),
            ],
          ),
          const Divider(height: 32),

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.7,
                  color: Colors.green,
                  strokeWidth: 6,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(),
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: null,
            color: Colors.indigo,
          ),
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 12,
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}
