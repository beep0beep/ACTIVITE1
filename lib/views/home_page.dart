import 'package:flutter/material.dart';
import '../controllers/emission_controller.dart';
import '../models/emission.dart';
import 'grille_emissions.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final EmissionController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onEmissionTapped(Emission emission) {
    final selected = widget.controller.onEmissionSelected(emission);
    final diffusions = widget.controller.getDiffusions(selected);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          emission: selected,
          diffusions: diffusions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emissions = widget.controller.getEmissions();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        title: const Text(
          'Vos émissions en streaming',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: GrilleEmissions(
          emissions: emissions,
          onTap: _onEmissionTapped,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}