import 'package:akari/widgets/logincontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
          SizedBox(height: 100),
          Logincontainer(),
        ],
      ),
    );
  }
}
