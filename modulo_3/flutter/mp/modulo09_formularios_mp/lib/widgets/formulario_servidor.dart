// lib/widgets/formulario_servidor.dart
import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _ctrlNombre  = TextEditingController();
  final _ctrlIp      = TextEditingController();
  final _ctrlPuerto  = TextEditingController(text: '22');
  final _ctrlUsuario = TextEditingController(text: 'carlos.ruiz');
  final _ctrlMac     = TextEditingController();

  // FocusNodes para navegación de teclado
  final _focusIp      = FocusNode();
  final _focusPuerto  = FocusNode();
  final _focusUsuario = FocusNode();
  final _focusMac     = FocusNode();

  // Variables de Estado
  String _so        = 'Recursos Humanos';
  String _servicio  = 'Presencial';
  bool   _ssl       = true;

  // Expresión regular para validar IPv4 y MAC
  static final _regexIp  = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
  static final _regexMac = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlIp.dispose();
    _ctrlPuerto.dispose();
    _ctrlUsuario.dispose();
    _ctrlMac.dispose();
    _focusIp.dispose();
    _focusPuerto.dispose();
    _focusUsuario.dispose();
    _focusMac.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':   _ctrlNombre.text.trim(),
      'ip':       _ctrlIp.text.trim(),
      'puerto':   _ctrlPuerto.text.trim(),
      'usuario':  _ctrlUsuario.text.trim(),
      'mac':      _ctrlMac.text.trim(),
      'so':       _so,
      'servicio': _servicio,
      'ssl':      _ssl.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [

          // ── Nombre del Empleado ───────────────────────────────────
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText:  'Nombre del empleado',
              hintText:   'Carlos Ruiz',
              prefixIcon: Icon(Icons.badge),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusIp.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3)                  return 'Mínimo 3 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Dirección IP / Código Red ──────────────────────────────
          TextFormField(
            controller:   _ctrlIp,
            focusNode:    _focusIp,
            decoration: const InputDecoration(
              labelText:  'Dirección IP de equipo asignado',
              hintText:   '192.168.1.100',
              prefixIcon: Icon(Icons.computer),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPuerto.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La IP es obligatoria';
              if (!_regexIp.hasMatch(v))  return 'Formato IPv4 inválido (ej. 192.168.1.10)';
              final octetos = v.split('.').map(int.parse).toList();
              if (octetos.any((o) => o > 255)) return 'Octeto fuera de rango (0–255)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Extensión / Puerto ────────────────────────────────────────────
          TextFormField(
            controller:   _ctrlPuerto,
            focusNode:    _focusPuerto,
            decoration: const InputDecoration(
              labelText:  'Extensión telefónica',
              prefixIcon: Icon(Icons.phone),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusUsuario.requestFocus(),
            validator: (v) {
              final puerto = int.tryParse(v ?? '');
              if (puerto == null)               return 'La extensión debe ser un número';
              if (puerto < 1 || puerto > 65535) return 'Extensión entre 1 y 65535';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Usuario de Dominio ───────────────────────────────────────
          TextFormField(
            controller:      _ctrlUsuario,
            focusNode:       _focusUsuario,
            decoration: const InputDecoration(
              labelText:  'Usuario de dominio institucional',
              prefixIcon: Icon(Icons.person_outline),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMac.requestFocus(),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El usuario es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Dirección MAC del Equipo ──────────────────────────────
          TextFormField(
            controller: _ctrlMac,
            focusNode:  _focusMac,
            decoration: const InputDecoration(
              labelText:  'Dirección MAC de credencial / equipo',
              hintText:   '00:1A:2B:3C:4D:5E',
              prefixIcon: Icon(Icons.perm_identity),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'La dirección MAC es obligatoria';
              if (!_regexMac.hasMatch(v)) return 'Formato MAC inválido (ej. AA:BB:CC:DD:EE:FF)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Departamento ──────────────────────────────────────
          DropdownButtonFormField<String>(
            value:      _so,
            decoration: const InputDecoration(
              labelText:  'Departamento asignado',
              prefixIcon: Icon(Icons.business),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Recursos Humanos', 'Tecnología', 'Finanzas',
              'Marketing', 'Operaciones',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _so = v!),
          ),
          const SizedBox(height: 12),

          // ── Modalidad de Trabajo ───────────────────────────────────
          DropdownButtonFormField<String>(
            value:      _servicio,
            decoration: const InputDecoration(
              labelText:  'Modalidad de trabajo',
              prefixIcon: Icon(Icons.work_outline),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Presencial', 'Remoto', 'Híbrido',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _servicio = v!),
          ),
          const SizedBox(height: 8),

          // ── Contratado Activo — SwitchListTile ──────────────────────
          SwitchListTile(
            title:     const Text('Empleado en estado Activo'),
            subtitle:  const Text('Habilitar acceso y nómina activa'),
            value:     _ssl,
            onChanged: (v) => setState(() => _ssl = v),
            secondary: const Icon(Icons.verified_user),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    _ctrlNombre.clear();
                    _ctrlIp.clear();
                    _ctrlMac.clear();
                    _ctrlPuerto.text = '22';
                    _ctrlUsuario.text = 'carlos.ruiz';
                  },
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon:  const Icon(Icons.save),
                  label: const Text('Guardar empleado'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}