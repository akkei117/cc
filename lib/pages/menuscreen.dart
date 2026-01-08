import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final VoidCallback onItemSelected;

  const MenuScreen({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF5B2C83), // violet
                    Color(0xFFB83280), // magenta
                    Color(0xFF8B1D3A), // deep red
                  ],
                ),
              ),
            ),
          ),
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
      
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
              const SizedBox(height: 30),
      
              _menuItem(Icons.home, "Home"),
              _menuItem(Icons.logout, "Exit"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onItemSelected,
    );
  }
}
