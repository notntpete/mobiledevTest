import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isAgreed = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _validateForm() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return false;
    }
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon:
                        const Icon(Icons.close, size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip: 'Close',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: constraints.maxHeight * 0.25,
                  width: double.infinity,
                  child: Image.network(
                    'https://cdn.discordapp.com/attachments/869943496788824107/1288302397160034365/hair_no_bg.png?ex=6708771a&is=6707259a&hm=d12eaebf729c7f5ce2f6dad9ba0d94f84455c8f6f51fbd8c8ecb4b9a77debc9e',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Image failed to load'));
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Create your account',
                    style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _isAgreed,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isAgreed = value ?? false;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text("I agree with Privacy and Policy"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          if (_isAgreed && _validateForm()) {
                            Navigator.pushNamed(context, '/otp');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please complete the form and agree to the terms.')),
                            );
                          }
                        },
                        child: const Text('Sign Up'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('or continue with'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.g_translate),
                          iconSize: 40,
                          onPressed: () {
                            Navigator.pushNamed(context, '/google');
                          },
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook),
                          iconSize: 40,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.apple, color: Colors.white),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text("Sign In",
                                style: TextStyle(color: Colors.red)),
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
