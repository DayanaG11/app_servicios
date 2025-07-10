import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ServiceListScreen extends StatelessWidget {
  final String tipo;
  final Position? position;

  const ServiceListScreen({
    required this.tipo,
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Servicio: $tipo')),
      body: Center(
        child: Text(position != null
            ? 'Ubicación actual: ${position!.latitude}, ${position!.longitude}'
            : 'No se pudo obtener ubicación'),
      ),
    );
  }
}
