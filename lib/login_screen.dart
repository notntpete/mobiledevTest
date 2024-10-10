import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulating a network call (replace with your actual login logic)
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to MealScreen directly
    Navigator.pushNamed(context, '/meal'); // Adjust the route as needed

    setState(() {
      _isLoading = false; // Stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.close),
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
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                'https://cdn.discordapp.com/attachments/869943496788824107/1288300114674323529/mouse_drawing-removebg-preview.png?ex=670874fa&is=6707237a&hm=5ccf443cd297decacb1971efa1742b73955cb72a87d95bab7f4f9e7bac4abd1c',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image failed to load'));
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Hello, Welcome Back!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
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
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
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
                    const Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: _isLoading ? null : _login, // Disable when loading
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(color: Colors.red)),
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
