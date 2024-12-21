import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/login/screens/login_employee.dart';
import 'package:pos_flutter/screens/login/screens/login_owner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double widthButton = MediaQuery.of(context).size.width - 20;
    final double screenHeight  = MediaQuery.of(context).size.height;
    final double spacing = screenHeight * 0.08;
    final TextStyle boldUnderLine = const TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
   
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColors.primaryColor,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
               
                Text("Welcome to POS !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppColors.secondaryColor,
                    )),
                 Text.rich(TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  text: "Select ",
                  children: <TextSpan>[
                    TextSpan(
                      text: "I am an owner ",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(text: "or "),
                    TextSpan(
                      text: " I am an employee",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        decorationColor: AppColors.primaryColor,
                      ),
                      ),
                     TextSpan(text: " to start"),
                  ] 
                )),
               
              ]),
             SizedBox(height: spacing), 
              Center(
                child: Image.asset("assets/images/form-signup.png"),
              ),
              SizedBox(height: spacing), 
              Column(
                children: [
                  SizedBox(
                    width: widthButton,
                    height: 60,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginOwnerScreen()));
                        },
                        icon: Row(
                          children: [
                            SizedBox(width: 40),
                            const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 35,
                            ),
                          ],
                        ),
                        label: Row(
                          children: [
                            SizedBox(width: 40),
                            const Text(
                              "I am the owner",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text(
                      "OR",
                    ),
                  ),
                  SizedBox(
                    width: widthButton,
                    height: 60,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginEmployeeScreen()));
                        },
                        icon: Row(
                          children: [
                            SizedBox(width: 40),
                            const Icon(
                              Icons.groups,
                              color: Colors.white,
                              size: 35,
                            ),
                          ],
                        ),
                        label: Row(
                          children: [
                            SizedBox(width: 40),
                            const Text(
                              "I am an employee",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
                SizedBox(height: spacing - 50), 
              Container(
                //margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? \n",
                    style: TextStyle(fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Create a new account',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                          )),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
              )
            ],
          ),
        )
        );
  }
}
