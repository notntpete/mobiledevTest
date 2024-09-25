import 'package:cs3midlogin/google_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'otp_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      initialRoute: '/', // Set Home screen as the initial route
      routes: {
        '/login': (context) => LoginScreen(), // This will not be used initially
        '/signup': (context) => SignupScreen(),
        '/otp': (context) => OtpScreen(),
        '/': (context) => HomeScreen(), // Route for Home screen
        "/google": (context) => GoogleScreen(),
      },
    );
  }
}
