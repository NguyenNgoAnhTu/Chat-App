import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/page/login.dart';
import 'package:chat_app/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginOrRegister(),
    );
  }
}
