import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final widthButton = MediaQuery.of(context).size.width - 20;
    final primaryColor = Theme.of(context).primaryColor;
    final secondary = Theme.of(context).colorScheme.secondary;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: primaryColor,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Welcome to POS !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: secondary,
                    )),
                Row(children: [
                  Text("Select I am an "),
                  Text(
                    "owner ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("or I am an employee to start"),
                ]),
              ]),
              SizedBox(height: 20),
              Center(
                child: Image.asset("assets/images/form-signup.png"),
              ),
              Column(
                children: [
                  SizedBox(
                    width: widthButton,
                    height: 60,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
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
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? \n",
                    style: TextStyle(fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Create a new account',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
