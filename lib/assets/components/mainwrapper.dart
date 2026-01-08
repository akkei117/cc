import 'package:cc/pages/homescreen.dart';
import 'package:cc/pages/menuscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Mainwrapper extends StatefulWidget {
  const Mainwrapper({super.key});

  @override
  State<Mainwrapper> createState() => _MainwrapperState();
}

class _MainwrapperState extends State<Mainwrapper> {
  final ZoomDrawerController _controller = .new();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5B2C83), Color(0xFFB83280), Color(0xFF8B1D3A)],
        ),
      ),
      child: ZoomDrawer(
        menuScreen: MenuScreen(
          onItemSelected: () {
            _controller.toggle;
          },
        ),
        mainScreen: Homescreen(controller: _controller),
      ),
    );
  }
}
