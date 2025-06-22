import 'package:flutter/material.dart';

class Logincontainer extends StatelessWidget {
  const Logincontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade100,

        ),
        child: Row(
          children: [
            Image.asset(''),
            
            Text('Sign in with google')
                      ],
        ),
      ),
    );
  }
}
