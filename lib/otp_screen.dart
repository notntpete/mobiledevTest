import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/869943496788824107/1288303791174586408/bird_no_bg.png?ex=66f4b1e7&is=66f36067&hm=232ce1c62c6e8cf01f007fc33d0ae9cf6fb2e9438507ac57e061ad16db71b5a5',
                  ), // Image URL
                  fit: BoxFit.cover, // Make the image cover the container
                ),
              ),
            ),
            SizedBox(height: 20), // Spacing between image and text
            Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
            SizedBox(height: 20), // Spacing between title and instruction
            Text('Enter the OTP sent to your email'),

            // Add space above the OTP boxes
            SizedBox(height: 20), // Space above the OTP boxes

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _otpBox(),
                _otpBox(),
                _otpBox(),
                _otpBox(),
              ],
            ),
            SizedBox(height: 20), // Add spacing between OTP boxes and buttons
            TextButton(
              onPressed: () {
                // Resend OTP logic
              },
              child: Text('Didn\'t receive OTP? Resend'),
            ),
            // Spacer to push the Verify button to the bottom
            Spacer(), // Takes up remaining space
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
                child: Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      child: TextField(
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
