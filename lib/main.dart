import 'package:akari/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ymzdfcuhnjuqfgpmtnoj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InltemRmY3Vobmp1cWZncG10bm9qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA2MTI5OTEsImV4cCI6MjA2NjE4ODk5MX0.gYLN1pz7gXN8hdQQq4IxVEGDFNvduTif_vz2VmLtHzU',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SplashScreen()),
    );
  }
}
