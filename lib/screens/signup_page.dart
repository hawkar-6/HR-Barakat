import 'dart:ui';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/bg.jpg", fit: BoxFit.cover),
          ),
          SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "دروستکردنی ئەکاونت",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // دووبارە بەکارهێنانەوەی هەمان ستایل بۆ ڕێکپۆشی ئەپەکە
                    _buildGlassInput("ناوی تەواو", Icons.person_outline),
                    const SizedBox(height: 18),
                    _buildGlassInput("ئیمەیڵ", Icons.email_outlined),
                    const SizedBox(height: 18),
                    _buildGlassInput("ژمارەی مۆبایل", Icons.phone_android),
                    const SizedBox(height: 18),
                    _buildGlassInput(
                      "وشەی تێپەڕ",
                      Icons.lock_outline,
                      isPass: true,
                    ),

                    const SizedBox(height: 45),

                    _buildSignupButton(
                      "تۆمارکردن",
                      () => Navigator.pop(context),
                    ),

                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "گەڕانەوە بۆ چوونەژوورەوە",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassInput(String hint, IconData icon, {bool isPass = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: TextField(
            obscureText: isPass,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white54),
              prefixIcon: Icon(icon, color: Colors.greenAccent),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupButton(String text, VoidCallback onPress) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF0D3D22),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
