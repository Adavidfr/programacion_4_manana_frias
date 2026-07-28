// lib/models/servidor_ssh.dart
class ServidorSSH {
  final String id;
  final String nombre;
  final String ip;
  final int    puerto;
  final bool   ssl;
  final bool   favorito;

  const ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
    this.favorito = false,
  });
}

const servidoresSimulados = [
  ServidorSSH(id:'1', nombre:'Carlos Ruiz — Analista RRHH', ip:'10.0.2.10', puerto:101, ssl:true, favorito:true),
  ServidorSSH(id:'2', nombre:'Ana García — Gerente RRHH',   ip:'10.0.2.20', puerto:102, ssl:true),
  ServidorSSH(id:'3', nombre:'Luis Morales — Soporte Tech', ip:'10.0.3.10', puerto:103, ssl:false),
  ServidorSSH(id:'4', nombre:'Beatriz López — Reclutadora', ip:'10.0.4.10', puerto:104, ssl:false),
];