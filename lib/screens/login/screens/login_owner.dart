import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/home/screens/home.dart';
import 'package:pos_flutter/screens/login/model/login_model.dart';
import 'package:pos_flutter/screens/login/widget/buttonOTP.dart';
import 'package:pos_flutter/screens/login/widget/textfieldLogin.dart';
import 'dart:developer' as developer;

import 'package:pos_flutter/widget/customButton.dart';

class LoginOwnerScreen extends StatefulWidget {
  const LoginOwnerScreen({super.key});

  @override
  State<LoginOwnerScreen> createState() => _LoginOwnerScreenState();
}

class _LoginOwnerScreenState extends State<LoginOwnerScreen> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LoginModel loginModel = LoginModel(email: _email, password: _password);
      developer.log('loginModel: $loginModel');
    }
  }

  int _selectedIndex = 1;

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index; // อัปเดตสถานะเมื่อปุ่มถูกเลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double spacing = (screenHeight * 0.08) - 30;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Welcome Owner",
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
        // alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextfieldLogin(
                  title: "Email",
                  textHint: "Enter your email",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _email = newValue!,
                ),
                TextfieldLogin(
                  title: "Password",
                  textHint: "Enter your password",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _password = newValue!,
                ),
                SizedBox(height: spacing),
                
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("send an OTP",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16))),
                  Row(
                    children: [
                      Column(children: [
                        ButtonOtp(
                            text: "Email",
                            icon: Icons.email,
                            isSelected: _selectedIndex == 1,
                            onPressed: () {
                              _selectButton(1);
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonOtp(
                            text: "SMS",
                            icon: Icons.sms,
                            isSelected: _selectedIndex == 2,
                            onPressed: () {
                              _selectButton(2);
                            }),
                      ]),
                      SizedBox(
                        width: 15,
                      ),
                      Column(children: [
                        ButtonOtp(
                            text: "Email",
                            icon: Icons.email,
                            isSelected: _selectedIndex == 3,
                            onPressed: () {
                              _selectButton(3);
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonOtp(
                            text: "Phone",
                            icon: Icons.phone,
                            isSelected: _selectedIndex == 4,
                            onPressed: () {
                              _selectButton(4);
                            }),
                      ])
                    ],
                  )
                ]),
                SizedBox(height: spacing * 2),
                CustomButton(
                    text: "Login",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    isOutlined: false,
                    primaryColor: AppColors.primaryColor),
                SizedBox(height: spacing - 20),
                Center(
                    child: Text("Forgot password?",
                        style: TextStyle(

                            decoration: TextDecoration.underline,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)
                            )
                            )
              ],
            )),
      ),
    );
  }
}
