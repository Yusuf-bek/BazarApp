import 'package:bazarapp/views/home_page.dart';
import 'package:bazarapp/views/login_page.dart';
import 'package:bazarapp/views/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BazarApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        "main-page": (BuildContext context) =>  const MainPage(),
      },
    );
  }
}
