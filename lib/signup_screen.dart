import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isAgreed = false; // Variable to hold checkbox state
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Function to validate form fields
  bool _validateForm() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return false; // Fields should not be empty
    }
    if (password != confirmPassword) {
      return false; // Passwords must match
    }
    // Add more validation logic if necessary (e.g., email format)
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Close button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close,
                        size: 30, color: Colors.black), // Set color to black
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to HomeScreen
                    },
                    tooltip: 'Close', // Add tooltip for better UX
                  ),
                ),
                SizedBox(height: 10),

                // Set image height to a smaller percentage of the screen height
                Container(
                  height:
                      constraints.maxHeight * 0.25, // 25% of available height
                  width: double.infinity, // Full width
                  child: Image.network(
                    'https://cdn.discordapp.com/attachments/869943496788824107/1288302397160034365/hair_no_bg.png?ex=66f4b09a&is=66f35f1a&hm=18d075d5f803d14a36314d2215ffe00ddc6d7a5d21138d51ca75b9e66aa4b4ed',
                    fit: BoxFit.cover, // Cover the container
                  ),
                ),
                SizedBox(height: 10),
                Text('Create your account', style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    // Allow scrolling if the keyboard opens
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Username'),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _isAgreed,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isAgreed =
                                      value ?? false; // Update checkbox state
                                });
                              },
                            ),
                            Expanded(
                              child: Text("I agree with Privacy and Policy"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Button Section
                Column(
                  children: [
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
                          // Simple validation check before navigating
                          if (_isAgreed && _validateForm()) {
                            Navigator.pushNamed(context, '/otp');
                          } else {
                            // Show an error if the form is not valid or the checkbox is not checked
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Please complete the form and agree to the terms.')),
                            );
                          }
                        },
                        child: Text('Sign Up'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('or continue with'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.g_translate),
                          iconSize: 40,
                          onPressed: () {
                            Navigator.pushNamed(context, '/google');
                            // Handle Google sign in logic
                          },
                        ),
                        SizedBox(width: 20),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook),
                          iconSize: 40,
                          onPressed: () {
                            // Handle Facebook sign in logic
                          },
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black, // Background color
                          ),
                          child: IconButton(
                            icon: Icon(Icons.apple,
                                color: Colors.white), // Apple icon
                            iconSize: 30, // Adjust icon size
                            onPressed: () {
                              // Handle Apple sign in logic
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Space before "Sign In" button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        SizedBox(width: 10), // Spacing between text and button
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5), // Padding around text
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.red), // Border color set to red
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded corners
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text("Sign In",
                                style:
                                    TextStyle(color: Colors.red)), // Text style
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
