import 'package:flutter/material.dart';
import 'proveedor_solicitudes_screen.dart';
import 'proveedor_mis_servicios_screen.dart';
import 'proveedor_chat_screen.dart';
import 'proveedor_profile_screen.dart';

class ProveedorHomeScreen extends StatefulWidget {
  const ProveedorHomeScreen({super.key});

  @override
  State<ProveedorHomeScreen> createState() => _ProveedorHomeScreenState();
}

class _ProveedorHomeScreenState extends State<ProveedorHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProveedorSolicitudesScreen(),
    ProveedorServicioScreen(),
    ProveedorChatScreen(),
    ProveedorProfileScreen(),
  ];

  final List<String> _titles = [
    'Solicitudes',
    'Servicios',
    'Chat',
    'Perfil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Solicitudes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.build), label: 'Servicios'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
