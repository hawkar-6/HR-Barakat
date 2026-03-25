import 'package:flutter/material.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.greenAccent),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("چێشتخانەی کوردی", style: TextStyle(color: Colors.greenAccent)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // --- لۆگۆی چێشتخانە ---
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.greenAccent, width: 2),
                ),
                child: const Icon(Icons.storefront, size: 80, color: Colors.greenAccent),
              ),
            ),
            const SizedBox(height: 10),
            const Text("چێشتخانەی کوردی", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("زانیاری تەواو دەربارەی ئەم شوێنە", style: TextStyle(color: Colors.grey)),
            
            const SizedBox(height: 30),
            
            // --- کاتی کارکردن ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("٨:٠٠ بەیانی - ١٠:٠٠ شەو", style: TextStyle(color: Colors.greenAccent)),
                  Text(":کاتی کارکردن", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("لیستی خواردنەکان (داشکان)", style: TextStyle(color: Colors.greenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),

            // --- لێرە لیستەکە دەست پێ دەکات ---
            foodItem("قۆزی گۆشت", "15,000", "12,000", "20%"),
            foodItem("یاپراخی تایبەت", "10,000", "8,000", "15%"),
            foodItem("کەبابی کوردی", "12,000", "10,500", "10%"),
          ],
        ),
      ),
    );
  }

  // --- ئەمە پارچە کۆدی هەر خواردنێکە ---
  Widget foodItem(String name, String oldPrice, String newPrice, String discount) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // دوگمەی کڕین
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.add, color: Colors.black),
          ),
          const Spacer(),
          // نرخ و ناو
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("$newPrice د.ک", style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  Text("$oldPrice", style: const TextStyle(color: Colors.red, decoration: TextDecoration.lineThrough, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(width: 15),
          // نیشانەی داشکان
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
            child: Text(discount, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}