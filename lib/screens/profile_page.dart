import 'package:app_servicios/screens/login_page.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;
  final bool isProvider;

  const ProfilePage({
    Key? key,
    this.userName = 'dayana',
    this.userEmail = 'hola@gmail.com',
    this.isProvider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.person, size: 80, color: Colors.blue),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                userName,
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                userEmail,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 32.0),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Detalles de la Cuenta'),
              onTap: () {
                print('Editar Detalles de la Cuenta');
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Métodos de Pago'),
              onTap: () {
                print('Métodos de Pago');
              },
            ),
            if (isProvider)
              ListTile(
                leading: Icon(Icons.work_history),
                title: Text('Historial de Trabajos'),
                onTap: () {
                  print('Ver Historial de Trabajos');
                },
              ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
              onTap: () {
                print('Cerrando Sesión');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}