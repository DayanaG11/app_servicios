import 'package:flutter/material.dart';
import 'package:app_servicios/screens/sing_up_page.dart';
import 'package:app_servicios/screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key); // Añadido el key para buenas prácticas
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
                  // ** Aquí está la clave para la navegación a Home **
                  // Por ahora, solo simula un inicio de sesión exitoso.
                  // En una aplicación real, aquí iría la validación con Firebase.
                  print('Email: ${_emailController.text}');
                  print('Contraseña: ${_passwordController.text}');

                  // Navegar a la pantalla de inicio (HomePage)

                  Navigator.pushReplacementNamed(context, '/home'); // Usando ruta con nombre

                  // O si no usas rutas con nombre:
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomePage()),
                  // );
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
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de registro
                Navigator.pushNamed(context, '/signup'); // Usando ruta con nombre

                // O si no usas rutas con nombre:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUpPage()),
                // );
              },
              child: Text("¿No tienes una cuenta? Regístrate"),
            ),
          ],
        ),
      ),
    );
  }
}