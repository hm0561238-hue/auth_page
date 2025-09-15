import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'signin_screen.dart'; // Correctly importing your file named signin_screen.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ameer Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // You might need to add a custom font or use a default
      ),
      initialRoute: '/signin', // Sets the sign-in screen as the first screen
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}