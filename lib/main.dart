import 'package:app_rental_oto/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rental Oto',
      theme: ThemeData(
        primaryColor: Color(0xFF512F99),
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      ),
      home: HomeScreen(),
    );
  }
}
