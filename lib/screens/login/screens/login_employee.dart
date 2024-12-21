import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/home/screens/home.dart';
import 'package:pos_flutter/screens/login/model/login_model.dart';
import 'package:pos_flutter/screens/login/widget/textfieldLogin.dart';
import 'package:pos_flutter/widget/customButton.dart';
import 'dart:developer' as developer;

class LoginEmployeeScreen extends StatefulWidget {
  const LoginEmployeeScreen({super.key});

  @override
  State<LoginEmployeeScreen> createState() => _LoginEmployeeScreenState();
}

class _LoginEmployeeScreenState extends State<LoginEmployeeScreen> {
  String _cashierCode = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LoginModel loginModel =
          LoginModel(cashierCode: _cashierCode, password: _password);
      developer.log('loginModel: $loginModel');
    }
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
          "Welcome Employee",
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
                  title: "Cashier code",
                  textHint: "ABC1234",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your cashier code';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _cashierCode = newValue!,
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
                CustomButton(
                    text: "Login",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    isOutlined: false,
                    primaryColor: AppColors.primaryColor),
                SizedBox(height: spacing - 20),
                Center(
                    child: Container(
                  
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0x1A1A72DD),
                      ),
                  child: Text.rich(TextSpan(
                    style: TextStyle(fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Use the cashier code which can be created by the owner in ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Manage Store ->  \n',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w500,
                              )),
                              TextSpan(
                              text: 'Cashier Code',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          // can add more TextSpans here...
                        ],
                      ),
                      // can add more TextSpans here...
                    ],
                  )),
                ))
              ],
            )),
      ),
    );
    ;
  }
}
