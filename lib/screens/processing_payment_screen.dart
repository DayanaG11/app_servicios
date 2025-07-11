import 'package:flutter/material.dart';

class ProcessingPaymentScreen extends StatelessWidget {
  final String serviceName;
  final String providerName;

  const ProcessingPaymentScreen({
    super.key,
    required this.serviceName,
    required this.providerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Procesando tu pago...',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const CircularProgressIndicator(
                color: Colors.green,
                strokeWidth: 6,
              ),
              const SizedBox(height: 30),
              Text(
                'Servicio: $serviceName',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                providerName,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
