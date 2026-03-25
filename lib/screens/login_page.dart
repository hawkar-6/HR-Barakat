import 'package:flutter/material.dart';
import 'signup_page.dart'; // دڵنیابە ئەم فایلەت دروست کردووە

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ١. وێنەی باکگراوند
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.black), // ئەگەر وێنەکە نەبوو ڕەش بێت
            ),
          ),
          // ٢. ڕەنگی ڕەشی شەفاف بۆ سەر وێنەکە
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.55)),
          ),
          // ٣. ناوەڕۆکی لاپەڕەکە
          SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "بەرەکەت",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "بەخێربێیتەوە بۆ ئەپەکەت",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 50),

                        _buildTextField(
                          "ئیمەیڵ",
                          Icons.email_outlined,
                          _emailController,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          "وشەی تێپەڕ",
                          Icons.lock_outline,
                          _passController,
                          isPass: true,
                        ),

                        const SizedBox(height: 40),

                        ElevatedButton(
                          onPressed: () {
                            // لێرەدا کۆدی چوونەژوورەوە دادەنێیت
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0D3D22),
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "چوونەژوورەوە",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "ئەکاونتت نییە؟ ",
                              style: TextStyle(color: Colors.white70),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupPage(),
                                ),
                              ),
                              child: const Text(
                                "دروستی بکە",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white10),
        ),
      ),
    );
  }
}
