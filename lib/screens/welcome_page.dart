import 'package:flutter/material.dart';
import 'package:barakat/nagor/constants.dart';
import 'package:barakat/screens/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // هەموو شتێک دەخاتە دەستە ڕاست
          child: Column(
            children: [
              const Spacer(),
              const Center(
                child: Icon(Icons.eco, size: 150, color: kPrimaryColor),
              ),
              const SizedBox(height: 40),
              const Text("بەخێرهاتی بۆ بەرەکەت", style: kTitleStyle),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "باشترین و تازەترین خواردنەکان لێرە بەدەست بهێنە و چێژی لێ وەربگرە.",
                  textAlign: TextAlign.center,
                  style: kSubtitleStyle,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppLoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "دەستپێکردن",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
