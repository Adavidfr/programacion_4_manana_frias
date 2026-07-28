// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart';

const int paso = 3;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: switch (paso) {
      1 => _paso1(),
      2 => Scaffold(
        appBar: AppBar(title: const Text('Logs de Auditoría de RRHH')),
        body: ListView(
          children: [
            TarjetaLog(
              nivel: 'ERROR',
              componente: 'rrhh-portal',
              mensaje: 'Contrato no firmado — recordatorio enviado al empleado',
              timestamp: DateTime.now(),
            ),
            TarjetaLog(
              nivel: 'WARN',
              componente: 'asistencia-control',
              mensaje: 'Tardanza detectada: 2 empleados registraron ingreso tardío',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
            ),
            TarjetaLog(
              nivel: 'INFO',
              componente: 'nomina-servicio',
              mensaje: 'Proceso de dispersión de nómina completado',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
            ),
            TarjetaLog(
              nivel: 'DEBUG',
              componente: 'evaluacion-desempeno',
              mensaje: 'GET /api/rrhh/evaluaciones → 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
            ),
          ],
        ),
      ),
      3 => const Scaffold(
        body: Column(
          children: [
            FilaEstado(
              nombre: 'Carlos Ruiz',
              detalle: 'Analista RRHH · Turno Mañana',
              activo: true,
            ),
            Divider(height: 1),
            FilaEstado(
              nombre: 'Ana García',
              detalle: 'Gerente RRHH · Turno Mañana',
              activo: true,
            ),
            Divider(height: 1),
            FilaEstado(
              nombre: 'Luis Morales',
              detalle: 'Licencia Médica · Sin Asistencia',
              activo: false,
            ),
            Divider(height: 1),
            FilaEstado(
              nombre: 'Beatriz López — Especialista en Contratación y Selección',
              detalle: 'Reclutadora Senior · Depto Selección',
              activo: true,
            ),
          ],
        ),
      ),
      4 => const Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarBadge(nombre: 'Carlos', alertas: 2, activo: true),
              SizedBox(width: 24),
              AvatarBadge(nombre: 'Ana', alertas: 0, activo: true),
              SizedBox(width: 24),
              AvatarBadge(nombre: 'Luis', alertas: 0, activo: false),
              SizedBox(width: 24),
              AvatarBadge(nombre: 'Beatriz', alertas: 5, activo: true),
            ],
          ),
        ),
      ),
      5 => Scaffold(
        appBar: AppBar(title: const Text('Layouts en Control de RRHH')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'SizedBox',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Ficha personal del empleado'),
            const SizedBox(height: 32),
            const Text('Historial de capacitaciones (después de 32px)'),

            const Divider(height: 32),

            const Text(
              'Padding',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.indigo.shade50,
              child: const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Datos confidenciales de nómina con Padding'),
              ),
            ),

            const Divider(height: 32),

            const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.settings, color: Colors.indigo),
            ),

            const Divider(height: 32),

            const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Contratación',
                'Nómina',
                'Asistencia',
                'Capacitación',
                'Evaluación',
                'Beneficios',
                'Inducción',
              ].map((t) => Chip(label: Text(t))).toList(),
            ),
          ],
        ),
      ),
      _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero')),
      ),
    },
  ),
);

Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width: 220,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.indigo, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        'Empleado EMP-01',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
);
