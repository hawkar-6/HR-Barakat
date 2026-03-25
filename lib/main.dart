import 'package:flutter/material.dart';
import 'screens/login_page.dart'; // دڵنیابە ئەم لایبەرەرییانەت هەیە
import 'screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barakat App',
      
      // ڕێکخستنی ڕەنگەکان بە یەکجار
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // لێرە تەنها یەک دانە "home" دادەنێیت
      // ئەگەر ویستت لاپەڕەی یەکەم بگۆڕیت، تەنها ناوەکەی ئێرە بگۆڕە
      home: const WelcomePage(), 
    );
  }
}