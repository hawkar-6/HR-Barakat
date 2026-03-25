import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedItems;
  final int totalPrice;

  const CartPage({super.key, required this.selectedItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("سەبەتەی کڕین", style: TextStyle(color: Colors.greenAccent)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.greenAccent), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(selectedItems[index]['name'], style: const TextStyle(color: Colors.white)),
                  subtitle: Text("${selectedItems[index]['count']} دانە", style: const TextStyle(color: Colors.grey)),
                  trailing: Text("${selectedItems[index]['price'] * selectedItems[index]['count']} د.ک", style: const TextStyle(color: Colors.greenAccent)),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.grey[900], borderRadius: const BorderRadius.vertical(top: Radius.circular(25))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$totalPrice د.ک", style: const TextStyle(color: Colors.greenAccent, fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("کۆی گشتی پارە", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // لێرە دەتوانیت وای لێ بکەیت داواکارییەکە بنێرێت بۆ خاوەن چێشتخانەکە
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, padding: const EdgeInsets.all(15)),
                    child: const Text("تەواوکردنی داواکاری", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}