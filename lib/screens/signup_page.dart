import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/bg.jpg", fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.65)),
          ),
          SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "دروستکردنی ئەکاونت",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),

                    _buildField(
                      "ناوی تەواو",
                      Icons.person_outline,
                      _nameController,
                    ),
                    const SizedBox(height: 15),
                    _buildField(
                      "ئیمەیڵ",
                      Icons.email_outlined,
                      _emailController,
                    ),
                    const SizedBox(height: 15),
                    _buildField(
                      "ژمارەی مۆبایل",
                      Icons.phone_android_outlined,
                      _phoneController,
                    ),
                    const SizedBox(height: 15),
                    _buildField(
                      "وشەی تێپەڕ",
                      Icons.lock_outline,
                      _passController,
                      isPass: true,
                    ),

                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // دەگەڕێتەوە بۆ لاپەڕەی لۆگین
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D3D22),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "تۆمارکردن",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _buildField(
    String hint,
    IconData icon,
    TextEditingController controller, {
    bool isPass = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      textAlign: TextAlign.right,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54, fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.greenAccent),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
