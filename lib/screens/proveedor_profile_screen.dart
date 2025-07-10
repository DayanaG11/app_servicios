import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProveedorProfileScreen extends StatefulWidget {
  const ProveedorProfileScreen({super.key});

  @override
  State<ProveedorProfileScreen> createState() => _ProveedorProfileScreenState();
}

class _ProveedorProfileScreenState extends State<ProveedorProfileScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? _documento;

  Future<void> _tomarFotoDocumento() async {
    final foto = await picker.pickImage(source: ImageSource.camera);
    if (foto != null) {
      setState(() {
        _documento = foto;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre completo',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Dirección',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Teléfono de contacto',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Número de cuenta bancaria',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _tomarFotoDocumento,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Tomar foto del documento'),
          ),
          if (_documento != null) ...[
            const SizedBox(height: 12),
            Image.file(
              File(_documento!.path),
              height: 150,
            ),
          ],
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para guardar el perfil
            },
            child: const Text('Guardar perfil'),
          ),
        ],
      ),
    );
  }
}
