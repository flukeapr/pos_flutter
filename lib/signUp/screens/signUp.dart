import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/signUp/model/model_signUp.dart';
import 'dart:developer' as developer;

import 'package:pos_flutter/widget/customButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  String _email = '';
  String _phone = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User newUser = User(email: _email, phone: _phone, password: _password);
      developer.log('newUser: $newUser');
    }
  }

  void _toggleEye() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondary = Theme.of(context).colorScheme.secondary;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double spacing = (screenHeight * 0.08) - 30;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Create an account",
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
              padding: const EdgeInsets.all(6),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: secondary, fontSize: 16,fontWeight:  FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Email",
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      validator:(value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _email = newValue!,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(color: secondary, fontSize: 16,fontWeight:  FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "XXX-XXX-XXXX",
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (newValue) => _phone = newValue!,
                    ),
                  ],
                ),
              ), 
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(color: secondary, fontSize: 16,fontWeight:  FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                   TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "************",
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: secondary,
                      ),
                      onPressed: _toggleEye,
                    ),
                  ),
                  obscureText: _obscureText,
                  onSaved: (newValue) => _password = newValue!,
                ),
                  ],
                ),
              ),      
              
              SizedBox(height: spacing),
              CustomButton(
                  text: "Create Account",
                  onPressed: _submitForm,
                  isOutlined: false,
                  primaryColor: primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
