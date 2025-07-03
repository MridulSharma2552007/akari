import 'package:akari/authservice/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final currentEmail = authService.getUserEmail();
    Future<void> signOut() async {
      await authService.signOut();
    }

    Future<void> loggleofflogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', false);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () async {
                await signOut();

                await loggleofflogin();
                if (context.mounted) {
                  Navigator.pushReplacementNamed(
                    context,
                    '/',
                  ); // Or push to LoginPage
                }
              },
              child: Icon(Icons.exit_to_app_rounded),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          currentEmail ?? 'No User Logged In',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
