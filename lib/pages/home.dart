import 'package:akari/authservice/auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final currentEmail = authService.getUserEmail();
    Future<void> signOut() async {
      await authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                signOut();
              },
              child: Icon(Icons.exit_to_app_rounded),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          currentEmail ?? 'No user logged in',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
