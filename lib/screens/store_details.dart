import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // بۆ ناردنی نامەی واتسئەپ

class StoreDetailsPage extends StatelessWidget {
  final String storeName;
  const StoreDetailsPage({super.key, required this.storeName});

  // فۆنکشن بۆ ناردنی نامە بۆ واتسئەپ
  void _sendOrder(String itemName, String price) async {
    String phoneNumber = "9647500000000"; // لێرە ژمارەی مۆبایلی دوکانەکە دابنێ
    String message =
        "سڵاو، دەمەوێت ئەم خواردنە داوا بکەم:\n- $itemName\n- نرخ: $price";
    var url = "https://wa.me/$phoneNumber?text=${Uri.parse(message)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          storeName,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // بەشی ناساندنی دوکانەکە
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.greenAccent,
                  child: Icon(Icons.store, size: 40, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  storeName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "ئێستا کراوەیە - گەیاندن هەیە",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "لیستی خواردنەکان",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // لیستی خواردنەکان
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFoodItem(
                  "قۆزی گۆشت",
                  "١٢,٥٠٠",
                  "١٨,٠٠٠",
                  "گۆشتی فرێی بەخێوکردنی ناوخۆ لەگەڵ برنجی کوردی",
                ),
                _buildFoodItem(
                  "یاپراخی کوردی",
                  "٨,٠٠٠",
                  "١٢,٠٠٠",
                  "یاپراخی گەرم بە تامی سماق",
                ),
                _buildFoodItem(
                  "کفتەی شلێ",
                  "٥,٥٠٠",
                  "٩,٠٠٠",
                  "کفتەی گەورە لە ناو شلەی تایبەت",
                ),
                _buildFoodItem(
                  "مریشکی برژاو",
                  "٧,٠٠٠",
                  "١٠,٠٠٠",
                  "مریشکی برژاو لەسەر خەڵوز",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(
    String name,
    String newPrice,
    String oldPrice,
    String desc,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          // وێنەی خواردن (لێرەدا وەک نموونە ئایکۆنە)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.fastfood,
              color: Colors.greenAccent,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          // زانیارییەکان
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "$newPrice د.ع",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // دوگمەی داواکردن
          IconButton(
            onPressed: () => _sendOrder(name, newPrice),
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
