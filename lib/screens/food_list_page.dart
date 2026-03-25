import 'package:flutter/material.dart';
import 'package:barakat/screens/cart_page.dart'; // دڵنیابە ئەمە لێرەیە

class FoodListPage extends StatefulWidget {
  final String restaurantName;
  const FoodListPage({super.key, required this.restaurantName});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<Map<String, dynamic>> foods = [
    {"name": "قۆزی گۆشت", "price": 12000, "oldPrice": "15,000", "count": 0, "discount": "20%"},
    {"name": "یاپراخی کوردی", "price": 8500, "oldPrice": "10,000", "count": 0, "discount": "15%"},
    {"name": "کەبابی تایبەت", "price": 10000, "oldPrice": "12,000", "count": 0, "discount": "16%"},
    {"name": "شێلم و کفتە", "price": 5500, "oldPrice": "7,000", "count": 0, "discount": "21%"},
  ];

  int getTotalPrice() {
    int total = 0;
    for (var item in foods) {
      total += (item['price'] as int) * (item['count'] as int);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.restaurantName, style: const TextStyle(color: Colors.greenAccent)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.greenAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return buildFoodCard(index);
              },
            ),
          ),
          // دوگمەی خوارەوە کە تەنها کاتێک دەردەکەوێت کە شتێک هەڵبژێردرێت
          if (getTotalPrice() > 0) buildBottomCartBar(),
        ],
      ),
    );
  }

  Widget buildFoodCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.greenAccent, size: 30),
                onPressed: () => setState(() => foods[index]['count']++),
              ),
              Text("${foods[index]['count']}", style: const TextStyle(color: Colors.white, fontSize: 18)),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent, size: 30),
                onPressed: () {
                  if (foods[index]['count'] > 0) setState(() => foods[index]['count']--);
                },
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(foods[index]['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("${foods[index]['price']} د.ک", style: const TextStyle(color: Colors.greenAccent)),
                  const SizedBox(width: 8),
                  Text(foods[index]['oldPrice'], style: const TextStyle(color: Colors.red, decoration: TextDecoration.lineThrough, fontSize: 11)),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
            child: Text(foods[index]['discount'], style: const TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget buildBottomCartBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              // لێرە لیستی ئەو خواردنانە دروست دەکەین کە کڕیار هەڵیبژاردوون
              List<Map<String, dynamic>> selectedItems = foods.where((item) => item['count'] > 0).toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    selectedItems: selectedItems,
                    totalPrice: getTotalPrice(),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("بینینی سەبەتە", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("کۆی گشتی", style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text("${getTotalPrice()} د.ک", style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}            