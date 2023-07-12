import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/views/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 206, 201, 1),
        
      ),
      home:StartScreen()
    );
  }

}

