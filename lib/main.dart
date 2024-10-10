import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'otp_screen.dart';
import 'home_screen.dart';
import 'google_screen.dart';
import 'meal_screen.dart'; // Importing the MealScreen

void main() {
  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      initialRoute: '/', // Initial route
      routes: {
        '/': (context) => HomeScreen(), // Home screen route
        '/login': (context) => LoginScreen(), // Login screen route
        '/signup': (context) => SignupScreen(), // Signup screen route
        '/otp': (context) => OtpScreen(), // OTP screen route
        '/google': (context) =>
            const GoogleScreen(), // Google auth screen route
        '/meal': (context) => MealScreen(), // Meal screen route
      },
      // Optionally, you can add theme data for consistent styling
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
