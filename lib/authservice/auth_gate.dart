import 'package:akari/pages/home.dart';

import 'package:akari/userinfo/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

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
        //check if there is a valid session
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return Home();
        } else {
          return Loginpage();
        }
      },
    );
  }
}
