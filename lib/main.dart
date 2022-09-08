import 'package:bazarapp/views/login_page.dart';
import 'package:bazarapp/views/main_page.dart';
import 'package:bazarapp/views/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        "main-page": (BuildContext context) => const MainPage(),
        "report-page": (BuildContext context) => const ReportPage(),
      },
    );
  }
}


//flutter build apk --split-per-abi
// flutter build appbundle