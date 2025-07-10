import 'package:flutter/material.dart';
import 'package:app_servicios/screens/login_page.dart'; // Asegúrate de importar tu LoginPage

enum UserType { customer, provider }

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserType? _selectedUserType = UserType.customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Nombre Completo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<UserType>(
                    title: const Text('Cliente'),
                    value: UserType.customer,
                    groupValue: _selectedUserType,
                    onChanged: (UserType? value) {
                      setState(() {
                        _selectedUserType = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<UserType>(
                    title: const Text('Proveedor'),
                    value: UserType.provider,
                    groupValue: _selectedUserType,
                    onChanged: (UserType? value) {
                      setState(() {
                        _selectedUserType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para registrarse
                  print('Nombre Completo: ${_fullNameController.text}');
                  print('Correo Electrónico: ${_emailController.text}');
                  print('Contraseña: ${_passwordController.text}');
                  print('Tipo de Usuario: $_selectedUserType');
                },
                child: Text(
                  'Registrarse', // Texto en español
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Volver a la pantalla de login
              },
              child: Text("¿Ya tienes una cuenta? Iniciar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}