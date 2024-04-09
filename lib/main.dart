// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:weather/pages/Weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 219, 140, 140),
      ),
      home: WeatherPage(),
    );
  }
}
