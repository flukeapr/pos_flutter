import 'package:flutter/material.dart';
import 'package:pos_flutter/login/screens/login.dart';
import 'package:pos_flutter/signUp/screens/signUp.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    final widthButton = MediaQuery.of(context).size.width - 20;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "POS",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
                SizedBox(height: 30,),
                Image.asset("assets/images/onBoarding.png"),
                SizedBox(height: 30,),
                Text(
                  "Easy Management for your Store.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A3256)
                  ),
                )
              ],

            )
            ),
            
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: widthButton,
                    child:  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginScreen()));
                    },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: primaryColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                       )
                     ),
                     child: Text(
                       "Get Started",
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                       ),
                     )
                     ),
                  ),
                  SizedBox(height: 40,),
                  SizedBox(
                    height: 60,
                    width: widthButton,
                    child:  OutlinedButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const SignupScreen()));
                    },
                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                       )
                     ),
                     child: Text(
                       "Create Account",
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: primaryColor
                       ),
                     )
                     ),
                  )
                 
                ],
              )
              )
        ],
      ) 
    );
  }
}
