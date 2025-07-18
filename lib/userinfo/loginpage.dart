import 'package:akari/widgets/logincontainer.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _PageoneState();
}

class _PageoneState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(
                  'assets/images/pageonepng.png',
                  height: 300,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Empowering Education',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 200),
              Logincontainer(),
              SizedBox(height: 20),
              Text(
                'Made with ❤️',
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
