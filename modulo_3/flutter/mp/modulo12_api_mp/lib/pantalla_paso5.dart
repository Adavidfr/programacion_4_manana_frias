// lib/pantalla_paso5.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'todo_dto.dart';

class EmpleadoApiClient {
  final http.Client client;
  EmpleadoApiClient(this.client);

  Future<List<TodoDto>> fetchTareasRRHH() async {
    final res = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=10'),
    );
    if (res.statusCode == 200) {
      final list = jsonDecode(res.body) as List<dynamic>;
      return list.map((e) => TodoDto.fromJson(e as Map<String, dynamic>)).toList();
    }
    throw Exception('Error HTTP ${res.statusCode}');
  }
}

final apiClientProvider = Provider((ref) => EmpleadoApiClient(http.Client()));

class TareasRRHHNotifier extends AsyncNotifier<List<TodoDto>> {
  @override
  Future<List<TodoDto>> build() async {
    final api = ref.watch(apiClientProvider);
    return api.fetchTareasRRHH();
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(apiClientProvider).fetchTareasRRHH());
  }
}

final tareasRRHHProvider = AsyncNotifierProvider<TareasRRHHNotifier, List<TodoDto>>(
  TareasRRHHNotifier.new,
);

class PantallaPaso5 extends ConsumerWidget {
  const PantallaPaso5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tareasAsync = ref.watch(tareasRRHHProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 5 · Arquitectura Completa'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: BackButton(onPressed: () => context.go('/')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(tareasRRHHProvider.notifier).recargar(),
            tooltip: 'Recargar tareas',
          ),
        ],
      ),
      body: tareasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $err'),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => ref.read(tareasRRHHProvider.notifier).recargar(),
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (tareas) => ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: tareas.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, i) {
            final t = tareas[i];
            return ListTile(
              leading: Icon(
                t.completed ? Icons.check_circle : Icons.pending_actions,
                color: t.completed ? Colors.green : Colors.orange,
              ),
              title: Text(t.title,
                  style: TextStyle(
                    decoration: t.completed ? TextDecoration.lineThrough : null,
                  )),
              subtitle: Text('ID Auditoría RRHH: ${t.id}'),
              trailing: Chip(
                label: Text(t.completed ? 'Completada' : 'Pendiente'),
                backgroundColor: t.completed ? Colors.green[100] : Colors.orange[100],
              ),
            );
          },
        ),
      ),
    );
  }
}
