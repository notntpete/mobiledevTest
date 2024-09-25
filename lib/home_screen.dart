import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the image from assets
            Container(
              height: 100, // Set a specific height for the image
              width: 100, // Set a specific width for the image
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
            SizedBox(height: 20), // Space between the image and the text

            // Welcome Text
            Text(
              'Welcome to Bernards',
              style: TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            SizedBox(height: 10), // Reduced space between text and buttons

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
                    child: Text('Sign In'),
                  ),
                ),
                SizedBox(height: 10), // Space between buttons
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
                    child: Text('Sign Up'),
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
