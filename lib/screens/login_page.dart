import 'package:flutter/material.dart';
import 'package:barakat/nagor/constants.dart';
import 'package:barakat/screens/signup_page.dart';
import 'package:barakat/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // کۆنتڕۆڵەرەکان بۆ وەرگرتنی نووسینەکان
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // لێرەدا وێنە نوێیەکە وەک باکگراوند دادەنێین
          image: DecorationImage(
            image: AssetImage("assets/images/jpg(2).jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl, // ڕاست بۆ چەپ
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("چوونەژوورەوە", style: kTitleStyle),
                        const SizedBox(height: 50),

                        _buildInput(
                          "ئیمەیڵ",
                          Icons.email_outlined,
                          _emailController,
                        ),
                        const SizedBox(height: 20),
                        _buildInput(
                          "وشەی تێپەڕ",
                          Icons.lock_outline,
                          _passController,
                          isPass: true,
                        ),

                        const SizedBox(height: 40),

                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xFF0D3D22,
                            ), // ڕەنگی سەوزە تۆخەکە
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
        ),
      ),
    );
  }

  Widget _buildInput(
    String hint,
    IconData icon,
    TextEditingController controller, {
    bool isPass = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPass,
      textAlign: TextAlign.right,
      style: const TextStyle(color: Colors.white),
      validator: (value) => (value == null || value.isEmpty)
          ? "تکایە ئەم خانەیە پڕ بکەرەوە"
          : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54, fontSize: 14),
        filled: true,
        fillColor: Colors.black.withOpacity(
          0.4,
        ), // ڕەنگی ناو خانەکە تۆخ بێت بۆ ئەوەی دەقەکە دیار بێت
        prefixIcon: Icon(icon, color: Colors.greenAccent, size: 22),
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
