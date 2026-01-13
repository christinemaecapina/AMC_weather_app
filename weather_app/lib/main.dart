import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart'; // 1. Import your WeatherScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      // Optional: Remove the debug banner from the corner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // You can define a consistent color scheme for your app
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // 2. Set the home property to your WeatherScreen
      home: const WeatherScreen(),
    );
  }
}