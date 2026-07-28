// lib/pantalla_paso3.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class EmpleadoDto {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String companyName;

  EmpleadoDto({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
  });

  factory EmpleadoDto.fromJson(Map<String, dynamic> json) => EmpleadoDto(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        companyName: (json['company'] != null)
            ? json['company']['name'] as String
            : 'Recursos Humanos',
      );

  Empleado toDomain() => Empleado(
        id: id,
        nombre: name,
        correo: email,
        telefono: phone,
        departamento: companyName,
      );
}

class Empleado {
  final int id;
  final String nombre;
  final String correo;
  final String telefono;
  final String departamento;

  const Empleado({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.departamento,
  });
}

class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<Empleado>> _fetchEmpleados() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => EmpleadoDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · API real + Modelo de Dominio'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<Empleado>>(
        future: _fetchEmpleados(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error al cargar empleados: ${snap.error}'));
          }

          final empleados = snap.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: empleados.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final emp = empleados[i];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cs.primaryContainer,
                    child: Icon(Icons.person, color: cs.onPrimaryContainer),
                  ),
                  title: Text(emp.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${emp.correo} • Depto: ${emp.departamento}'),
                  trailing: Text('ID: ${emp.id}',
                      style: TextStyle(color: cs.onSurfaceVariant, fontSize: 12)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
