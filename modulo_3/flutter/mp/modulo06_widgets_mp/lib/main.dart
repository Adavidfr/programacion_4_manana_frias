// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';

const int paso = 6;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Contratado', color: Colors.green),
            Etiqueta(texto: 'Inactivo',   color: Colors.red,    relleno: true),
            Etiqueta(texto: 'En Permiso', color: Colors.orange),
            Etiqueta(texto: 'En Revisión',color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Capacitado', color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'Carlos Ruiz — Analista RRHH'),
      ),
    ),
    5 => Scaffold(                               // Paso 3b
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Intentos de acceso al sistema RRHH',
              limite:   3,
              color:    Colors.red,
              onLimite: () => debugPrint('¡Acceso a expediente bloqueado!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Solicitudes de vacaciones aprobadas',
              limite:   10,
              color:    Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              // Paso 4
      appBar: AppBar(title: const Text('Registro de Asistencia — Control de Horarios')),
      body: const Center(child: Reloj()),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sistema de Control de Recursos Humanos y Gestión de Personal',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}