import 'package:flutter/material.dart';
import 'package:app_servicios/screens/sing_up_page.dart';
import 'package:app_servicios/screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  print('¿Olvidaste tu contraseña?');
                },
                child: Text('¿Olvidaste tu contraseña?'),
              ),
            ),
            SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  print('Email: ${_emailController.text}');
                  print('Contraseña: ${_passwordController.text}');
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text(
                  'Iniciar Sesión',
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

            // 👇 Botón para entrar como proveedor
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/proveedor');
                },
                child: Text(
                  'Entrar como proveedor (demo)',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),

            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("¿No tienes una cuenta? Regístrate"),
            ),
          ],
        ),
      ),
    );
  }
}
