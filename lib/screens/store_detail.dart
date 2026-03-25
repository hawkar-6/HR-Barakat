import 'package:flutter/material.dart';

class StoreDetailsPage extends StatelessWidget {
  final String storeName;

  const StoreDetailsPage({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ڕەنگی پشتەوە وەک ئەپەکەت ڕەشە
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          storeName,
          style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.greenAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // وێنەیەکی نموونەیی یان لۆگۆی شوێنەکە
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.greenAccent, width: 2),
                ),
                child: const Icon(Icons.store, size: 60, color: Colors.greenAccent),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              storeName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "زانیاری تەواو دەربارەی ئەم شوێنە لێرەدا دەردەکەوێت",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            // لیستێکی نموونەیی بۆ کاڵاکان یان خزمەتگوزارییەکان
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("کاتی کارکردن:", style: TextStyle(color: Colors.white)),
                    Text("٨:٠٠ بەیانی - ١٠:٠٠ شەو", style: TextStyle(color: Colors.greenAccent)),
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