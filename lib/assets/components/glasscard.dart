import 'dart:ui';
import 'package:flutter/material.dart';

class Glasscontainer extends StatefulWidget {
  final Widget content;
  final double? radius;
  final double? height;
  final double? sigmaX;
  final double? sigmaY;

  const Glasscontainer({
    super.key,
    required this.content,
    this.radius,
    this.height,
    this.sigmaX,
    this.sigmaY,
  });

  @override
  State<Glasscontainer> createState() => _GlasscontainerState();
}

class _GlasscontainerState extends State<Glasscontainer> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(widget.radius ?? 20);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.sigmaX ?? 6,
            sigmaY: widget.sigmaY ?? 6,
          ),
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.28),
                  Color.fromRGBO(255, 255, 255, 0.18),
                  Color.fromRGBO(255, 255, 255, 0.12),
                ],
              ),
              border: Border.all(
                color: Color.fromRGBO(255, 255, 255, 0.25),
                width: 0.8,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.18),
                  blurRadius: 30,
                  spreadRadius: 1,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: widget.content,
          ),
        ),
      ),
    );
  }
}
