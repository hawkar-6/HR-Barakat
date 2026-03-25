import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String title;
  final String itemCount; // بۆ نموونە: ١٠ جۆر خواردن
  final IconData logoIcon;
  final VoidCallback onTap;

  const ShopCard({
    super.key,
    required this.title,
    required this.itemCount,
    required this.logoIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // بەشی لۆگۆی دوکانەکە
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.greenAccent.withOpacity(0.1),
                    child: Icon(logoIcon, size: 35, color: Colors.greenAccent),
                  ),
                ),
              ),
            ),
            // زانیارییەکان
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(subtitle, style: const TextStyle(color: Colors.grey)),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
