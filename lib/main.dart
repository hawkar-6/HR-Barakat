import 'package:flutter/material.dart';
import 'package:barakat/screens/welcome_page.dart';

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

      // بۆ ئەوەی هەموو ئەپەکە بە شێوەیەکی گشتی ئاراستەی ڕاست بۆ چەپی هەبێت (کوردی)
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },

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

      // لێرەدا WelcomePage وەک یەکەم لاپەڕە دادەنێین بۆ دەستپێک
      home: const WelcomePage(),

      // لێرە تەنها یەک دانە "home" دادەنێیت
      // ئەگەر ویستت لاپەڕەی یەکەم بگۆڕیت، تەنها ناوەکەی ئێرە بگۆڕە
    );
  }
}
