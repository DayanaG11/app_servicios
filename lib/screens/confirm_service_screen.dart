import 'package:flutter/material.dart';

class ConfirmServiceScreen extends StatefulWidget {
  final String providerName;
  final String serviceName;
  final String date;
  final String time;
  final String providerImageUrl;

  final void Function(bool arrived, int rating, String comment)? onConfirm;

  const ConfirmServiceScreen({
    super.key,
    required this.providerName,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.providerImageUrl,
    this.onConfirm, // ✅ nuevo parámetro
  });

  @override
  State<ConfirmServiceScreen> createState() => _ConfirmServiceScreenState();
}

class _ConfirmServiceScreenState extends State<ConfirmServiceScreen> {
  bool? serviceCompleted = true;
  double rating = 5.0;
  final TextEditingController commentController = TextEditingController();

  void onConfirmPressed() {
    // ✅ Ejecutar callback si se proporcionó
    if (widget.onConfirm != null) {
      widget.onConfirm!(
        serviceCompleted ?? false,
        rating.round(),
        commentController.text,
      );
    }

    // ✅ También puedes enviar datos al backend aquí

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiayuda')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              '¿Recibiste el servicio correctamente?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.providerImageUrl),
                  radius: 30,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Proveedor: ${widget.providerName}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('Servicio: ${widget.serviceName}'),
                      Text('Fecha: ${widget.date}'),
                      Text('Hora: ${widget.time}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('¿El proveedor llegó y realizó el servicio?'),
            ListTile(
              leading: Radio<bool>(
                value: true,
                groupValue: serviceCompleted,
                onChanged: (value) => setState(() => serviceCompleted = value),
              ),
              title: const Text('Sí'),
            ),
            ListTile(
              leading: Radio<bool>(
                value: false,
                groupValue: serviceCompleted,
                onChanged: (value) => setState(() => serviceCompleted = value),
              ),
              title: const Text('No'),
            ),
            const SizedBox(height: 10),
            const Text('Califica el servicio'),
            Slider(
              value: rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: '${rating.round()} estrellas',
              onChanged: (value) => setState(() => rating = value),
            ),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                labelText: 'Comentario (opcional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onConfirmPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('Confirmar y finalizar'),
            ),
            const SizedBox(height: 10),
            const Text(
              '¡Gracias! Tu opinión nos ayuda a mejorar la calidad de los servicios.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
