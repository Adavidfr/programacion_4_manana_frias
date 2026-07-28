// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'screens/pantalla_busqueda.dart';
import 'screens/pantalla_dashboard.dart';
import 'screens/pantalla_metricas.dart';
import 'screens/pantalla_servidores.dart';

// ┌────────────────────────────────────────────────────────────────────────┐
// │  Cambia este número (1-5) para visualizar cada paso en la pantalla:  │
// │  1 → Paso 1: StateProvider básico (Contador de empleados)            │
// │  2 → Paso 2: NotifierProvider (Lista de empleados de RRHH)           │
// │  3 → Paso 3: Provider Derivado (Búsqueda y filtrado de empleados)    │
// │  4 → Paso 4: AsyncNotifierProvider (Métricas de desempeño laboral)   │
// │  5 → Paso 5: Dashboard completo con NavigationBar (Riverpod Tabs)    │
// └────────────────────────────────────────────────────────────────────────┘
const int paso = 5;

// StateProvider — Paso 1
final contadorProvider = StateProvider<int>((ref) => 5);

void main() {
  runApp(const ProviderScope(child: AppMonitoreo()));
}

class AppMonitoreo extends StatelessWidget {
  const AppMonitoreo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const PantallaServidores(),
        3 => const PantallaBusqueda(),
        4 => const PantallaMetricas(),
        5 => const PantallaDashboard(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso no válido (Elige de 1 a 5)'))),
      },
    );
  }
}

// ─── Paso 1 — Contador Básico con StateProvider ───────────────────────────
class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 1: Empleados Activos'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('empleados registrados en nómina'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}