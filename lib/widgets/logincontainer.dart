import 'package:akari/authservice/auth_service.dart';
import 'package:akari/pageviewpages/pageone_signin.dart';
import 'package:flutter/material.dart';

class Logincontainer extends StatefulWidget {
  const Logincontainer({super.key});

  @override
  State<Logincontainer> createState() => _LogincontainerState();
}

class _LogincontainerState extends State<Logincontainer> {
  //authservice
  final authservice = AuthService();
  //email controller
  final _emailcontroller = TextEditingController();
  //pass controller
  final _passwordcontroller = TextEditingController();
  //login button logic
  void login() async {
    final email = _emailcontroller.text;
    final password = _passwordcontroller.text;
    try {
      await authservice.signInWithEmailPassword(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.grey.shade900,
          content: Text('Error : $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordcontroller,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageoneSignin(),
                        ),
                      );
                    },
                    child: Text(
                      'SignIn',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    onPressed: () {
                      login();
                    },
                    child: Text('LogIn', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
