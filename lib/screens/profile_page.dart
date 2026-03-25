import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "پڕۆفایل",
          style: TextStyle(color: Colors.greenAccent),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // وێنەی پڕۆفایل
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF1E1E1E),
              child: Icon(Icons.person, size: 60, color: Colors.greenAccent),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "ڕەوەند عەلی",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("rawand@gmail.com", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),

          // لیستی هەڵبژاردنەکان
          _buildProfileItem(Icons.history, "مێژووی داواکارییەکان"),
          _buildProfileItem(Icons.location_on_outlined, "ناونیشانەکانم"),
          _buildProfileItem(Icons.settings_outlined, "ڕێکخستنەکان"),
          _buildProfileItem(Icons.help_outline, "پەیوەندی بە ئێمە"),

          const Spacer(),
          // دوگمەی چوونەدەرەوە
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context); // دەچێتەوە بۆ لاپەڕەی Login
                },
                child: const Text("چوونەدەرەوە"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.greenAccent),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
      onTap: () {},
    );
  }
}
