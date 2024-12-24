import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:se215_nutrifit/presentation/screens/navigation/navigation.dart';

// Thêm dòng này

Future main() async {
  // Initialize dependencies

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),

      home: Navigation(),
      debugShowCheckedModeBanner: false, // Bỏ nhãn DEBUG
    );
  }
}
