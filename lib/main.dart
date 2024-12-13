import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/onBoarding/screens/onBoarding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1A72DD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF1A72DD),
          secondary: Color(0xFF2A3256),
        ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
