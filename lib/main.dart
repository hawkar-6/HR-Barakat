import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:barakat/screen/login_page.dart'; // هێنانەناوەی لاپەڕەی لۆگین
import 'package:barakat/screen/home_page.dart';  // هێنانەناوەی لاپەڕەی سەرەکی
=======

import 'package:barakat/screens/welcome_page.dart'; // هێنانەناوەی لاپەڕەی بەخێرهاتنی نوێ
import 'package:barakat/nagor/constants.dart'; // فایلی نەگۆڕەکان لەناو فۆڵدەری nagor
>>>>>>> 104a7ede3789e9307e42de429a70e526ccb2dff7

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      title: 'Barakat App',
      theme: ThemeData(
        brightness: Brightness.dark, // ڕەنگی ڕەش بۆ هەموو ئەپەکە
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      // لێرەدا دیاری دەکەین کام لاپەڕە یەکەم جار بێتە پێش چاو
      // ئەگەر ویستت بچیتەوە سەر لاپەڕەکەی خۆت، تەنها بینووسە HomePage()
      home: const LoginPage(), 
=======

      title: 'Barakat App',
      theme: ThemeData(
        // لێرەدا دەتوانیت kPrimaryColor بەکاربهێنیت بۆ ئەوەی Theme ی ئەپەکەش سەوز بێت
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // لێرەدا WelcomeScreen وەک یەکەم لاپەڕە دادەنێین
      // ئەگەر ویستت ڕاستەوخۆ بچێتە سەر لۆگین، بیگۆڕە بۆ LoginScreen()
      home: const WelcomePage(),
>>>>>>> 104a7ede3789e9307e42de429a70e526ccb2dff7
    );
  }
}
