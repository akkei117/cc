import 'package:cc/assets/components/glasscard.dart';
import 'package:cc/pages/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc/assets/components/model.dart';

class Homescreen extends StatefulWidget {
  final ZoomDrawerController controller;

  const Homescreen({super.key, required this.controller});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> currencyIcons = ["INR", "USD", "RUB", "CNY"];
  final List<String> currency = ["Rupees", "Dollar", "Ruble", "Renminbi"];

  String _fromCurrency = "INR";
  String _toCurrency = "USD";

  late TextEditingController _fromCurrencyController;
  late TextEditingController _toCurrencyController;
  late TextEditingController _inputController;
  late TextEditingController _outputController;

  @override
  void initState() {
    super.initState();
    _fromCurrencyController = TextEditingController(text: _fromCurrency);
    _toCurrencyController = TextEditingController(text: _toCurrency);
    _inputController = TextEditingController();
    _outputController = TextEditingController();
  }

  @override
  void dispose() {
    _fromCurrencyController.dispose();
    _toCurrencyController.dispose();
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    final text = _inputController.text.trim();
    if (text.isEmpty) {
      _outputController.text = "";
      return;
    }

    final amount = double.tryParse(text);
    if (amount == null) {
      _outputController.text = "";
      return;
    }

    final result = CurrencyConverter.convert(
      from: _fromCurrency,
      to: _toCurrency,
      amount: amount,
    );

    _outputController.text = result.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5B2C83),
                      Color(0xFFB83280),
                      Color(0xFF8B1D3A),
                    ],
                  ),
                ),
              ),
            ),
            Glasscontainer(
              radius: 20,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ZoomDrawer.of(context)?.toggle();
                              },
                              child: const CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, 0.2),
                                child:
                                    Icon(Icons.menu, color: Colors.white),
                              ),
                            ),
                            const CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(255, 255, 255, 0.2),
                              child:
                                  Icon(Icons.person, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: Colors.white24),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Dropdown(
                              hintText: "From",
                              dropdownMenuEntries: List.generate(
                                currency.length,
                                (i) => DropdownMenuEntry(
                                  value: currencyIcons[i],
                                  label: currency[i],
                                ),
                              ),
                              controller: _fromCurrencyController,
                              onSelected: (value) {
                                if (value == null) return;
                                setState(() {
                                  _fromCurrency = value;
                                  _fromCurrencyController.text = value;
                                });
                                _convertCurrency();
                              },
                            ),
                            const Icon(Icons.swap_horiz,
                                color: Colors.white),
                            Dropdown(
                              hintText: "To",
                              dropdownMenuEntries: List.generate(
                                currency.length,
                                (i) => DropdownMenuEntry(
                                  value: currencyIcons[i],
                                  label: currency[i],
                                ),
                              ),
                              controller: _toCurrencyController,
                              onSelected: (value) {
                                if (value == null) return;
                                setState(() {
                                  _toCurrency = value;
                                  _toCurrencyController.text = value;
                                });
                                _convertCurrency();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          _fromCurrency,
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _inputController,
                            keyboardType: TextInputType.number,
                            onChanged: (_) => _convertCurrency(),
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText:
                                  "Enter the amount in $_fromCurrency",
                              hintStyle: GoogleFonts.orbitron(
                                color: Colors.white38,
                              ),
                              enabledBorder:
                                  const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white38),
                              ),
                              focusedBorder:
                                  const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          _toCurrency,
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _outputController,
                            readOnly: true,
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText:
                                  "Your amount will be in $_toCurrency",
                              hintStyle: GoogleFonts.orbitron(
                                color: Colors.white38,
                              ),
                              enabledBorder:
                                  const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white38),
                              ),
                              focusedBorder:
                                  const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Glasscontainer(
                      sigmaX: 0,
                      sigmaY: 0,
                      content: GestureDetector(
                        onTap: _convertCurrency,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Convert",
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
