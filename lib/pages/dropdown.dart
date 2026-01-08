import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Dropdown extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final TextEditingController controller;
  final ValueChanged<String?> onSelected;

  const Dropdown({
    super.key,
    required this.hintText,
    required this.dropdownMenuEntries,
    required this.controller,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      menuStyle: const MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          Color.fromRGBO(0, 0, 0, 0),
        ),
        shadowColor: WidgetStatePropertyAll(Colors.white54),
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.white24),
        ),
      ),
      controller: controller,
      width: 140,
      hintText: hintText,
      dropdownMenuEntries: dropdownMenuEntries,
      onSelected: onSelected, 
      textStyle: GoogleFonts.poppins(color: Colors.white),
      
    );
  }
}
