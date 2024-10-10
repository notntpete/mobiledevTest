import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space elements evenly
          children: [
            // Image at the top of the screen
            Container(
              width: double.infinity, // Make the image fit the screen width
              height:
                  screenHeight * 0.3, // Set height to 30% of the screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/869943496788824107/1288303791174586408/bird_no_bg.png?ex=67087867&is=670726e7&hm=db10c25c631b3261961756a719227aceac6149af952dac90b2a652303b4ef408',
                  ), // Updated Image URL
                  fit: BoxFit.cover, // Make the image cover the container
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing between image and text
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
            const SizedBox(height: 20), // Spacing between title and instruction
            const Text('Enter the OTP sent to your email'),

            // Add space above the OTP boxes
            const SizedBox(height: 20), // Space above the OTP boxes

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _otpBox(),
                _otpBox(),
                _otpBox(),
                _otpBox(),
              ],
            ),
            const SizedBox(
                height: 20), // Add spacing between OTP boxes and buttons
            TextButton(
              onPressed: () {
                // Resend OTP logic
              },
              child: const Text('Didn\'t receive OTP? Resend'),
            ),
            // Spacer to push the Verify button to the bottom
            const Spacer(), // Takes up remaining space
            SizedBox(
              width: double.infinity, // Make the button width fit the screen
              child: ElevatedButton(
                onPressed: () {
                  // Handle OTP verification logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[100], // Light red color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Rounded corners
                  ),
                ),
                child: const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      child: const TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
      ),
    );
  }
}
