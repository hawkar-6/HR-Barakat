import 'package:flutter/material.dart';
import 'login-page.dart';
import 'signup-page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF8B0000), Color(0xFF4A0000), Color(0xFF000000)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white12,
              child: Icon(Icons.headset_mic, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "بەخێرهاتی",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            // دوگمەی چوونە ژوورەوە
            _btn(
              context,
              "SIGN IN",
              Colors.white,
              const Color(0xFF8B0000),
              const LoginPage(),
            ),
            const SizedBox(height: 15),

            // دوگمەی دروستکردنی ئەکاونت
            _btn(
              context,
              "SIGN UP",
              Colors.transparent,
              Colors.white,
              const SignupPage(),
              border: true,
            ),

            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.camera_alt, color: Colors.white),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _btn(
    BuildContext context,
    String txt,
    Color bg,
    Color txCol,
    Widget page, {
    bool border = false,
  }) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Container(
        width: 260,
        height: 55,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(30),
          border: border ? Border.all(color: Colors.white) : null,
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(color: txCol, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
