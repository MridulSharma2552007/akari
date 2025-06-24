// ignore_for_file: camel_case_types

import 'package:akari/authservice/userdata_upload_service.dart';
import 'package:akari/userinfo/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Userrole extends StatefulWidget {
  const Userrole({super.key});

  @override
  State<Userrole> createState() => _UserroleState();
}

class _UserroleState extends State<Userrole> {
  String userRole = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select your role',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/role.png'),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              setState(() {
                userRole = 'Teacher';
                UserdataUploadService().role = 'Teacher';
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Userinfo()),
              );
            },
            child: roleselectContainer(
              text: 'Teacher',
              imagePath: 'assets/images/teacher.png',
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                userRole = 'Teacher';
                UserdataUploadService().role = 'Student';
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Userinfo()),
              );
            },
            child: roleselectContainer(
              text: 'Student',
              imagePath: 'assets/images/students.png',
            ),
          ),
        ],
      ),
    );
  }
}

class roleselectContainer extends StatefulWidget {
  final String text;
  final String imagePath;
  const roleselectContainer({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  State<roleselectContainer> createState() => _roleselectContainerState();
}

class _roleselectContainerState extends State<roleselectContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(widget.imagePath),
              ),
            ),
            SizedBox(width: 20),
            Text(
              widget.text,
              style: GoogleFonts.lexend(fontSize: 20, color: Colors.black),
            ),
            Spacer(),
            Icon(Icons.arrow_forward),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
