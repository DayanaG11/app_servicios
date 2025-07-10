import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'chat_screen.dart';
import 'profile_page.dart';
import 'service_detalis_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Position? _position;

  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Limpieza', 'icon': Icons.cleaning_services},
    {'name': 'Fontanería', 'icon': Icons.plumbing},
    {'name': 'Electricidad', 'icon': Icons.electrical_services},
    {'name': 'Pintura', 'icon': Icons.format_paint},
    {'name': 'Aire acondicionado', 'icon': Icons.ac_unit},
    {'name': 'Estilistas', 'icon': Icons.cut},
    {'name': 'Reparación de casas', 'icon': Icons.home_repair_service},
    {'name': 'Jardinería', 'icon': Icons.grass},
    {'name': 'Cuidado de mascotas', 'icon': Icons.pets},
  ];

  final List<Map<String, dynamic>> _popularServices = [
    {
      'name': 'Limpieza del Hogar',
      'rating': 4.5,
      'description': 'Limpieza detallada de tu hogar',
      'price': 50.0,
      'image': 'assets/cleaning_service.jpg'
    },
    {
      'name': 'Reparación de Tuberías',
      'rating': 4.8,
      'description': 'Reparación de fugas en tuberías y desagües',
      'price': 75.0,
      'image': 'assets/plumbing_service.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    if (await Permission.location.request().isGranted) {
      final pos = await Geolocator.getCurrentPosition();
      setState(() {
        _position = pos;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      _buildHomeContent(),
      Center(child: Text('Pantalla de búsqueda (en desarrollo)')),
      ChatScreen(),
      ProfilePage(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue, // mismo color para no seleccionados
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_position != null)
            Text(
              'Ubicación: ${_position!.latitude.toStringAsFixed(4)}, ${_position!.longitude.toStringAsFixed(4)}',
              style: TextStyle(color: Colors.grey[700]),
            ),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Categorías', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.5,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                elevation: 2.0,
                child: InkWell(
                  onTap: () {
                    print('Seleccionado: ${_categories[index]['name']}');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_categories[index]['icon'], size: 40, color: Colors.blue),
                      const SizedBox(height: 8),
                      Text(
                        _categories[index]['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Servicios Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _popularServices.length,
            itemBuilder: (context, index) {
              final service = _popularServices[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                elevation: 2.0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceDetailPage(service: service)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(service['name'], style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4.0),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 20.0),
                                  Text('${service['rating']}'),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                service['description'],
                                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          '\$${service['price'].toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}