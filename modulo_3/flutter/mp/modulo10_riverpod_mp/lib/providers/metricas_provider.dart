// lib/providers/metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaServidor>> {
  @override
  Future<List<MetricaServidor>> build() => _fetch();

  Future<List<MetricaServidor>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaServidor(servidor:'Carlos Ruiz (Analista RRHH)', cpu:85.2, ram:92.1, conexiones:23, ssd: 160),
      MetricaServidor(servidor:'Ana García (Gerente RRHH)',    cpu:92.1, ram:98.2, conexiones:40, ssd: 160),
      MetricaServidor(servidor:'Luis Morales (Soporte Tech)',  cpu:72.4, ram:81.0, conexiones:15, ssd: 140),
      MetricaServidor(servidor:'Beatriz López (Reclutadora)',  cpu:88.0, ram:90.0, conexiones:30, ssd: 150),
      MetricaServidor(servidor:'David Fernández (Contador)',  cpu:65.0, ram:70.0, conexiones:10, ssd: 120),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaServidor>>(
  MetricasNotifier.new,
);