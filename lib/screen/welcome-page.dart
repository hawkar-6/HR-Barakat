import 'package:flutter/material.dart';
import 'login-page.dart';
import 'signup-page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // بەکارهێنانی MediaQuery بۆ ئەوەی قەبارەی شاشەکە بزانین
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8B0000), // سووری تۆخ
              Color(0xFF4A0000), // سووری مامناوەند
              Color(0xFF000000), // ڕەش
            ],
          ),
        ),
        // بەکارهێنانی SingleChildScrollView بۆ ئەوەی کێشەی Overflow نەمێنێت
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),

                // ١. لۆگۆ و ئایکۆنی سەرەکی
                _buildLogo(),

                const SizedBox(height: 30),

                // ٢. دەقی بەخێرهاتن
                const Text(
                  "بەخێرهاتی",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 100),

                // ٣. دوگمەی چوونە ژوورەوە (Sign In)
                _customButton(
                  context,
                  "SIGN IN",
                  Colors.white,
                  const Color(0xFF8B0000),
                  const LoginPage(),
                ),

                const SizedBox(height: 20),

                // ٤. دوگمەی دروستکردنی ئەکاونت (Sign Up)
                _customButton(
                  context,
                  "SIGN UP",
                  Colors.transparent,
                  Colors.white,
                  const SignupPage(),
                  hasBorder: true,
                ),

                const SizedBox(height: 60),

                // ٥. بەشی سۆشیاڵ میدیا
                const Text(
                  "Login with social media",
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
                const SizedBox(height: 20),
                _buildSocialIcons(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // مێتۆد بۆ دروستکردنی لۆگۆ
  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
      ),
      child: const Icon(
        Icons.auto_awesome_motion,
        size: 70,
        color: Colors.white,
      ),
    );
  }

  // مێتۆد بۆ دروستکردنی دوگمەکان بە شێوەیەکی ڕێک و پێک
  Widget _customButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
    Widget targetPage, {
    bool hasBorder = false,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        width: 280,
        height: 55,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: hasBorder ? Border.all(color: Colors.white, width: 2) : null,
          boxShadow: [
            if (!hasBorder)
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // مێتۆد بۆ ئایکۆنەکانی سۆشیاڵ میدیا
  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialCircle(Icons.facebook),
        const SizedBox(width: 20),
        _socialCircle(Icons.camera_alt),
        const SizedBox(width: 20),
        _socialCircle(Icons.alternate_email),
      ],
    );
  }

  Widget _socialCircle(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
