import 'package:app_servicios/screens/proveedor_home_screen.dart';
import 'package:app_servicios/screens/proveedor_mis_servicios_screen.dart';
import 'package:app_servicios/screens/proveedor_profile_screen.dart';
import 'package:app_servicios/screens/proveedor_solicitudes_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_servicios/screens/login_page.dart'; // Asegúrate que la ruta sea correcta
import 'package:app_servicios/screens/home_screen.dart'; // Asegúrate que la ruta sea correcta
import 'package:app_servicios/screens/sing_up_page.dart'; // Importa la pantalla de registro
import 'package:app_servicios/screens/profile_page.dart'; // Importa la pantalla de perfil
import 'package:app_servicios/screens/service_detalis_page.dart'; // Importa la pantalla de detalles de servicio


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiayuda', // El título de tu aplicación [cite: 1]
      theme: ThemeData(
        primarySwatch: Colors.blue, // Usando el color azul como principal [cite: 26]
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define la ruta inicial de tu aplicación
      initialRoute: '/proveedor',
      // Define todas las rutas de tu aplicación
      routes: {
        '/': (context) => LoginPage(), // Pantalla de Inicio de Sesión
        '/signup': (context) => SignUpPage(), // Pantalla de Registro
        '/home': (context) => HomePage(), // Pantalla de Inicio (Home)
        '/profile': (context) => const ProfilePage(),
        '/proveedor': (context) => const ProveedorHomeScreen(),
        '/proveedor/servicios': (context) => const ProveedorServicioScreen(),
        '/proveedor/solicitudes': (context) => const ProveedorSolicitudesScreen(),
        '/proveedor/perfil': (context) => const ProveedorProfileScreen(),

         },
      // Si usas rutas generadas para manejar argumentos (como en ServiceDetailPage)
      onGenerateRoute: (settings) {
        if (settings.name == '/service_details') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return ServiceDetailPage(service: args);
            },
          );
        }
        return null; // Deja que Flutter maneje otras rutas
      },
    );
  }
}