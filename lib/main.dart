import 'package:flutter/material.dart';
import 'package:barakat/screens/welcome_page.dart';
import 'package:barakat/nagor/constants.dart'; // ئەمە گرنگە بۆ ڕەنگەکان

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

      // ڕێکخستنی ئاراستەی نووسین بۆ کوردی (RTL)
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          // لێرەدا kPrimaryColor بەکاردێنین کە لە constants دامانناوە
          seedColor: kPrimaryColor,
          brightness: Brightness.dark,
        ),
      ),

      // ئەپەکە بە لاپەڕەی بەخێرهاتن دەست پێ دەکات
      home: const WelcomePage(),
    );
  }
}
