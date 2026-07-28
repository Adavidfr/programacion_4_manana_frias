// lib/screens/scaffold_con_nav.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldConNav extends StatelessWidget {
  final Widget child;
  const ScaffoldConNav({super.key, required this.child});

  static const _rutas = ['/servidores', '/metricas', '/ajustes'];

  int _indiceActual(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final idx = _rutas.indexWhere((r) => location.startsWith(r));
    return idx < 0 ? 0 : idx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indiceActual(context),
        onDestinationSelected: (i) => context.go(_rutas[i]),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            selectedIcon: Icon(Icons.badge),
            label: 'Empleados',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Métricas',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
