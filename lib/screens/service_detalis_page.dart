import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceDetailPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Servicio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              service['name'] ?? 'Servicio Desconocido',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 24.0),
                Text(
                  '${service['rating'] ?? 'N/A'}',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(width: 8.0),
                Text(
                  '(2.0 reseñas)',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              service['description'] ?? 'No hay descripción disponible para este servicio.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Precio:',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${service['price']?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              height: 55.0,
              child: ElevatedButton(
                onPressed: () {
                  print('Solicitar Servicio para: ${service['name']}');
                },
                child: Text(
                  'Solicitar Servicio',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}