import 'package:flutter/material.dart';
import 'package:barakat/screens/welcome_page.dart'; // هێنانەناوەی لاپەڕەی بەخێرهاتنی نوێ
import 'package:barakat/nagor/constants.dart'; // فایلی نەگۆڕەکان لەناو فۆڵدەری nagor

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

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // لێرەدا WelcomePage وەک یەکەم لاپەڕە دادەنێین بۆ دەستپێک
      home: const WelcomePage(),
    );
  }
}
