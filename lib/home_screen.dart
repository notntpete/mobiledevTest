import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the image from assets
            SizedBox(
              height: 100, // Set a specific height for the image
              width: 100, // Set a specific width for the image
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
            const SizedBox(height: 20), // Space between the image and the text

            // Welcome Text
            const Text(
              'Welcome to Bernards',
              style: TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            const SizedBox(height: 10), // Space between text and buttons

            // Button Row
            Column(
              children: [
                // Sign In Button
                SizedBox(
                  width: double.infinity, // Full width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/login'); // Navigate to LoginScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[200],
                    ),
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 10), // Space between buttons
                // Sign Up Button
                SizedBox(
                  width: double.infinity, // Full width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/signup'); // Navigate to SignupScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[200],
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),
                const SizedBox(height: 10), // Additional spacing for aesthetics
                // Meal Button
                SizedBox(
                  width: double.infinity, // Full width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/meal'); // Navigate to MealScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200],
                    ),
                    child: const Text('Random Meal'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
