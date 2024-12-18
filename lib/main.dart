import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/onBoarding/screens/onBoarding.dart';
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
          primaryColor: Color(0xFF1A72DD),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF1A72DD),
            secondary: Color(0xFF2A3256),
          ),
          useMaterial3: true,
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
