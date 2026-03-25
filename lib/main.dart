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
    );
  }
}
