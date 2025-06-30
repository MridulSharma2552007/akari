import 'package:akari/authservice/userdata_upload_service.dart';
import 'package:akari/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _rollnocontroller = TextEditingController();
  Future<void> insertUserNameAndRollNo({
    required String name,
    required int RollNo,
  }) async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    final userService = UserdataUploadService();
    if (user == null) {
      print("❌ User Not logged in ");
    }
    final response = await supabase.from('profile').insert({
      'name': name,
      'roll no.': RollNo,
      'created_at': DateTime.now().toIso8601String(),
      'role': userService.role,
      'email': user?.email,
    });
    if (response.error != null) {
      print("❌ Failed: ${response.error!.message}");
    } else {
      print("✅ Data inserted successfully");
    }
  }

  void togglelogginswitch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6FC),
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F6FC),
        elevation: 0,
        title: Text(
          'Tell me about Yourself',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset('assets/images/pageuserinfo.png', height: 200),

            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFieldContainer(
                    label: 'Name',
                    controller: _namecontroller,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 16),
                  TextFieldContainer(
                    label: 'Roll Number',
                    controller: _rollnocontroller,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      print('Name: ${_namecontroller.text}');
                      print('Roll No: ${_rollnocontroller.text}');
                      final name = _namecontroller.text.trim();
                      final roll = int.tryParse(_rollnocontroller.text.trim());
                      if (name.isNotEmpty && roll != null) {
                        insertUserNameAndRollNo(name: name, RollNo: roll);
                      }
                      togglelogginswitch();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Save and Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            InfoBox(),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextFieldContainer({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Your information will be stored securely in our Supabase database. Please enter meaningful and correct data to help us maintain your profile.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
