// lib/pantalla_paso4.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

sealed class ApiError {
  final String mensaje;
  const ApiError(this.mensaje);
}

class ApiErrorRed extends ApiError {
  const ApiErrorRed() : super('Sin conexión a Internet o servidor no disponible.');
}

class ApiErrorServidor extends ApiError {
  final int statusCode;
  const ApiErrorServidor(this.statusCode)
      : super('Error en el servidor de RRHH (Código HTTP $statusCode).');
}

class ApiErrorDesconocido extends ApiError {
  const ApiErrorDesconocido(super.mensaje);
}

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final ApiError error;
  Failure(this.error);
}

class PantallaPaso4 extends StatefulWidget {
  const PantallaPaso4({super.key});

  @override
  State<PantallaPaso4> createState() => _PantallaPaso4State();
}

class _PantallaPaso4State extends State<PantallaPaso4> {
  Result<Map<String, dynamic>>? _resultado;
  bool _cargando = false;

  Future<void> _consultarExpediente(String endpoint) async {
    setState(() {
      _cargando = true;
      _resultado = null;
    });

    try {
      final res = await http.get(Uri.parse(endpoint));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        setState(() {
          _resultado = Success(data);
          _cargando = false;
        });
      } else {
        setState(() {
          _resultado = Failure(ApiErrorServidor(res.statusCode));
          _cargando = false;
        });
      }
    } catch (e) {
      setState(() {
        _resultado = Failure(const ApiErrorRed());
        _cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 4 · Errores Tipados (Result<T>)'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Prueba de manejo de errores tipados en la API de RRHH:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _cargando
                        ? null
                        : () => _consultarExpediente(
                            'https://jsonplaceholder.typicode.com/users/1'),
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Éxito (200 OK)'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _cargando
                        ? null
                        : () => _consultarExpediente(
                            'https://jsonplaceholder.typicode.com/invalid_endpoint_404'),
                    icon: const Icon(Icons.error_outline),
                    label: const Text('Error (404)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_cargando)
              const Center(child: CircularProgressIndicator())
            else if (_resultado != null)
              switch (_resultado!) {
                Success(:final data) => Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.badge, color: Colors.green),
                              SizedBox(width: 8),
                              Text('Expediente cargado con éxito',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ],
                          ),
                          const Divider(),
                          Text('Nombre: ${data['name']}'),
                          Text('Usuario: ${data['username']}'),
                          Text('Email: ${data['email']}'),
                        ],
                      ),
                    ),
                  ),
                Failure(:final error) => Card(
                    color: Colors.red.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.warning, color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  error.mensaje,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Tipo de error: ${error.runtimeType}',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.red.shade700)),
                        ],
                      ),
                    ),
                  ),
              },
          ],
        ),
      ),
    );
  }
}
