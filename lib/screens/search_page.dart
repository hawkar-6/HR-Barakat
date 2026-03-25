import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("گەڕان", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // خانەی گەڕان
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "بگەڕێ بۆ چێشتخانە یان دەرمانخانە...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.greenAccent),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // بەشی "زۆرترین گەڕانەکان"
            const Align(
              alignment: Alignment.centerRight,
              child: Text("زۆرترین گەڕانەکان", 
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            
            Wrap(
              spacing: 10,
              children: [
                _buildSearchTag("پیتزا"),
                _buildSearchTag("بەرگر"),
                _buildSearchTag("دەرمانی شەکرە"),
                _buildSearchTag("کباب"),
                _buildSearchTag("شیرینی"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTag(String label) {
    return Chip(
      backgroundColor: const Color(0xFF1E1E1E),
      label: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}