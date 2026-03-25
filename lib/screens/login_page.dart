import 'package:flutter/material.dart';
import 'package:barakat/nagor/constants.dart';
import 'package:barakat/screens/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl, // بۆ ڕاستکردنەوەی ئاراستەی نووسین
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("چوونە ژوورەوە", style: kTitleStyle),
              const SizedBox(height: 30),
              _buildInput("ئیمەیڵ"),
              const SizedBox(height: 15),
              _buildInput("وشەی تێپەڕ", isPass: true),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "چوونە ژوورەوە",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("ئەکاونتت نییە؟"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "دروستکردنی ئەکاونت",
                      style: TextStyle(color: kAccentGreen),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String hint, {bool isPass = false}) {
    return TextField(
      obscureText: isPass,
      textAlign: TextAlign.right, // نووسینی ناو چوارگۆشەکە لە ڕاستەوە بێت
      decoration: InputDecoration(
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
