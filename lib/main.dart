import 'package:flutter/material.dart';
import 'package:barakat/screen/login_page.dart'; // هێنانەناوەی لاپەڕەی لۆگین
import 'package:barakat/screen/home_page.dart';  // هێنانەناوەی لاپەڕەی سەرەکی

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
      theme: ThemeData(
        brightness: Brightness.dark, // ڕەنگی ڕەش بۆ هەموو ئەپەکە
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      // لێرەدا دیاری دەکەین کام لاپەڕە یەکەم جار بێتە پێش چاو
      // ئەگەر ویستت بچیتەوە سەر لاپەڕەکەی خۆت، تەنها بینووسە HomePage()
      home: const LoginPage(), 
    );
  }
}