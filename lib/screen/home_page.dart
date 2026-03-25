import 'package:flutter/material.dart';
import '../widgets/shop_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "خواردنی پاشەکەوتکراو",
          style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "باشترین ئۆفەرەکان",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            // لیستەکەت لێرەوە دەست پێ دەکات
            ShopCard(
              title: "چێشتخانەی کوردی",
              subtitle: "٣ ژەم ماوەتەوە",
              price: "٤,٥٠٠ د.ع",
              oldPrice: "١٠,٠٠٠ د.ع",
            ),
            ShopCard(
              title: "پیتزا ستاڕ",
              subtitle: "٥ دانە ماوەتەوە",
              price: "٦,٠٠٠ د.ع",
              oldPrice: "١٤,٠٠٠ د.ع",
            ),
            ShopCard(
              title: "فێست فوود",
              subtitle: "١ دانە ماوەتەوە",
              price: "٣,٠٠٠ د.ع",
              oldPrice: "٧,٥٠٠ د.ع",
            ),
          ],
        ),
      ),
    );
  }
}