import 'package:flutter/material.dart';

class GoogleScreen extends StatelessWidget {
  const GoogleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/icon.png')),
      ),
    );
  }
}
