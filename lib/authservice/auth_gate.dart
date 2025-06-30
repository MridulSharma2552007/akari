import 'package:akari/pages/home.dart';

import 'package:akari/userinfo/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool isLoggedIn = false;
  Future<void> checkloggedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkloggedin();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        //if loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (isLoggedIn == true) {
          return const Home();
        } else {
          return const Loginpage();
        }
        //bupass login
      },
    );
  }
}
