import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/onBoarding/screens/onBoarding.dart';
import 'package:pos_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
