import 'package:flutter/material.dart';

class ProveedorChatScreen extends StatelessWidget {
  const ProveedorChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'nombre': 'Juan Pérez', 'mensaje': '¿Cuándo puedes venir?'},
      {'nombre': 'Ana López', 'mensaje': 'Gracias por el servicio!'},
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(chats[index]['nombre']!),
          subtitle: Text(chats[index]['mensaje']!),
          onTap: () {
            // Navegar a pantalla de chat detallado
          },
        );
      },
    );
  }
}