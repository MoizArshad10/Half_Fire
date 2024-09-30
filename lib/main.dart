import 'package:flutter/material.dart';
import 'package:twentyfive/pages/another.dart';
import 'package:twentyfive/pages/getdata.dart';
import 'package:twentyfive/pages/login.dart';
import 'package:twentyfive/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twentyfive/pages/send.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: WowPage(),
    );
  }
}