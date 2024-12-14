import 'package:flutter/material.dart';
import 'package:pos_flutter/login/screens/login.dart';
import 'package:pos_flutter/signUp/screens/signUp.dart';
import 'package:pos_flutter/widget/customButton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor; // primary color of the app
    final double screenHeight = MediaQuery.of(context).size.height; // height of the screen
    final double spacing = screenHeight * 0.08; // 8% of the screen height

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          child:  Column(
          children: [
            SizedBox(height: spacing,),
            Text(
              "POS",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/onBoarding.png"),
            SizedBox(
              height: 30,
            ),
            Text(
              "Easy Management for your Store.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2A3256)),
            ),
            SizedBox(
              height: spacing*2,
            ),
            CustomButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen())
                          );
                },
                isOutlined: false,
                primaryColor: primaryColor
                ),
            SizedBox(
              height: spacing -40,
            ),
            CustomButton(
                text: "Create Account",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen())
                          );
                },
                isOutlined: true,
                primaryColor: primaryColor
                ),

          ],
        ),
        )
        );
  }
}
