// lib/screens/pantalla_dialogs.dart
import 'package:flutter/material.dart';

class PantallaDialogs extends StatelessWidget {
  const PantallaDialogs({super.key});

  void _mostrarSnackBar(BuildContext context, {bool esError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          esError
              ? 'Error: no se pudo actualizar la ficha del empleado'
              : 'Expediente de empleado actualizado correctamente',
        ),
        backgroundColor: esError ? Theme.of(context).colorScheme.error : null,
        action: SnackBarAction(label: 'Deshacer', onPressed: () {}),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _mostrarSnackBarInformativo(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.info, color: Colors.white),
            SizedBox(width: 12),
            Expanded(child: Text('Proceso de nómina mensual completado.')),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _mostrarConfirmacion(BuildContext context) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber, color: Colors.orange),
        title: const Text('Dar de baja empleado'),
        content: const Text(
          '¿Estás seguro de que deseas dar de baja a Carlos Ruiz?\n'
          'Esta acción registrará el cese en el expediente de RRHH.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Dar de baja'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;

    if (confirmar == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Empleado dado de baja correctamente')),
      );
    }
  }

  Future<void> _mostrarInformacion(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.info_outline, color: Colors.blue),
        title: const Text('Información del Empleado'),
        content: const Text(
          'Nombre: Carlos Ruiz\n'
          'ID: EMP-2026-042\n'
          'Departamento: Recursos Humanos\n'
          'Estado: Activo\n'
          'Antigüedad: 2 años 4 meses',
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  Future<void> _mostrarFormulario(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final ctrlNombre = TextEditingController();
    final ctrlPuesto = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Agregar Empleado'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: ctrlNombre,
                decoration: const InputDecoration(labelText: 'Nombre Completo'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: ctrlPuesto,
                decoration: const InputDecoration(labelText: 'Puesto / Cargo'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(ctx);
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;
    if (ctrlNombre.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Empleado "${ctrlNombre.text}" registrado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialog — RRHH'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('SnackBar', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _mostrarSnackBar(context),
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('SnackBar de éxito'),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
            ),
            onPressed: () => _mostrarSnackBar(context, esError: true),
            icon: const Icon(Icons.error_outline),
            label: const Text('SnackBar de error'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: () => _mostrarSnackBarInformativo(context),
            icon: const Icon(Icons.info),
            label: const Text('SnackBar informativo'),
          ),

          const Divider(height: 32),

          Text(
            'AlertDialog',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: cs.error,
              side: BorderSide(color: cs.error),
            ),
            onPressed: () => _mostrarConfirmacion(context),
            icon: const Icon(Icons.delete_outline),
            label: const Text('Dar de baja empleado (confirmación)'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () => _mostrarFormulario(context),
            child: const Text('Agregar empleado (formulario)'),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: cs.tertiary),
            onPressed: () => _mostrarInformacion(context),
            icon: const Icon(Icons.info_outline),
            label: const Text('Ver información de expediente'),
          ),
        ],
      ),
    );
  }
}
