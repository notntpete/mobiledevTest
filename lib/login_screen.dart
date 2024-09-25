import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
        leading: IconButton(
          icon: Icon(Icons.close), // Change to "X" icon
          onPressed: () {
            Navigator.pushNamed(context, '/'); // Navigate to HomeScreen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image that fits the width and height of the screen
            Container(
              width: double.infinity, // Full width
              height: MediaQuery.of(context).size.height *
                  0.3, // Set height as 30% of screen height
              child: Image.network(
                'https://cdn.discordapp.com/attachments/869943496788824107/1288300114674323529/mouse_drawing-removebg-preview.png?ex=66f4ae7a&is=66f35cfa&hm=c0e53a0e1c247cd93ee86895aa3e00b2791cfdabd34819bc90444b0c86c04afc&',
                fit: BoxFit
                    .cover, // Cover the whole container while maintaining aspect ratio
              ),
            ),
            SizedBox(height: 20),
            Text('Hello, Welcome Back!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            // Username TextField with Rounded Border and Light Red Background
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.red[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Password TextField with Rounded Border and Light Red Background
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.red[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            // Sign In Button with light red color and rounded square shape
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[100], // Light red color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Handle sign-in logic
                },
                child: Text('Sign In'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Sign In Icon
                IconButton(
                  icon: Icon(Icons.g_translate),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pushNamed(context, '/google');
                    // Handle Google sign in logic
                  },
                ),
                SizedBox(width: 20),
                // Facebook Sign In Icon using FontAwesome
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  iconSize: 40,
                  onPressed: () {
                    // Handle Facebook sign in logic
                  },
                ),
                SizedBox(width: 20),
                // Apple Sign In Circular Icon
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black, // Background color
                  ),
                  child: IconButton(
                    icon: Icon(Icons.apple, color: Colors.white), // Apple icon
                    iconSize: 30, // Adjust icon size
                    onPressed: () {
                      // Handle Apple sign in logic
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add space between buttons

            // Row for "Don't have an account?" text and "Sign Up" button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(width: 10), // Spacing between text and button
                // Sign Up Button with Rounded Border around text
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5), // Padding around text
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.red), // Border color set to red
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text("Sign Up",
                        style: TextStyle(color: Colors.red)), // Text style
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
