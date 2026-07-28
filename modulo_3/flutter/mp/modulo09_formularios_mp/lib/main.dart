// lib/main.dart
import 'package:flutter/material.dart';
import 'models/servidor_ssh.dart';
import 'screens/pantalla_busqueda.dart';
import 'screens/pantalla_servidores.dart';
import 'widgets/fila_servidor.dart';
import 'widgets/formulario_servidor.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaServidores(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlHostname = TextEditingController();
  final _ctrlIp       = TextEditingController();
  final _ctrlPuerto   = TextEditingController(text: '101');
  final _focusIp      = FocusNode();
  final _focusPuerto  = FocusNode();

  @override
  void dispose() {
    _ctrlHostname.dispose();
    _ctrlIp.dispose();
    _ctrlPuerto.dispose();
    _focusIp.dispose();
    _focusPuerto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Acceso a Expediente — RRHH'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlHostname,
              decoration:      const InputDecoration(
                labelText:  'Nombre de empleado',
                hintText:   'Carlos Ruiz',
                prefixIcon: Icon(Icons.badge),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusIp.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlIp,
              focusNode:       _focusIp,
              decoration:      const InputDecoration(
                labelText:  'Dirección IP de equipo',
                hintText:   '192.168.1.100',
                prefixIcon: Icon(Icons.computer),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusPuerto.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlPuerto,
              focusNode:   _focusPuerto,
              decoration:  const InputDecoration(
                labelText:  'Extensión de oficina',
                prefixIcon: Icon(Icons.phone),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Accediendo a expediente de ${_ctrlHostname.text} '
                      '(${_ctrlIp.text}:${_ctrlPuerto.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.folder_shared),
              label: const Text('Consultar expediente'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlHostname.clear();
                _ctrlIp.clear();
                _ctrlPuerto.text = '101';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Paso 2 ────────────────────────────────────────
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo Empleado'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioServidor(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} — ${datos['ip']}:${datos['puerto']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─── Paso 3 ────────────────────────────────────────
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final List<dynamic> _servidores = [
    ServidorSSH(id:'1', nombre:'Carlos Ruiz',  ip:'10.0.2.10',   puerto:101,  usuario:'carlos.ruiz',   so:'Recursos Humanos', ssl:true,  favorito:true),
    ServidorSSH(id:'2', nombre:'Ana García',   ip:'10.0.2.20',   puerto:102,  usuario:'ana.garcia',    so:'Finanzas',          ssl:true),
    ServidorSSH(id:'3', nombre:'Luis Morales',  ip:'10.0.3.10',   puerto:103,  usuario:'luis.morales',  so:'Tecnología',        ssl:false),
    ServidorSSH(id:'4', nombre:'Beatriz López', ip:'192.168.1.5', puerto:104,  usuario:'beatriz.lopez', so:'Marketing',         ssl:false),
   
    ServiciosWeb(id1:'5', nombre:'Servicios de Selección', ip:'192.168.1.2', puerto:80, usuario:'Danna Gonzalez', favorito: false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Empleados (${_servidores.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _servidores.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.badge_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin empleados registrados', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _servidores.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) {
                final item = _servidores[i];
                return FilaServidor(
                  servidor: item,
                  onFavorito: () {
                    setState(() {
                      item.favorito = !item.favorito;
                    });
                  },
                  onEliminar: () {
                    setState(() {
                      _servidores.removeAt(i);
                    });
                  },
                );
              },
            ),
    );
  }
}
