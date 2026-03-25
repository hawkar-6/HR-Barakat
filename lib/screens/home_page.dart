import 'package:flutter/material.dart';
import 'package:barakat/screens/food_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Barakat Service", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white)),
        ],
      ),
      body: _selectedIndex == 0 ? buildHomeScreen(context) : const Center(child: Text("لاپەڕەکانی تر", style: TextStyle(color: Colors.white))),
      
      // --- گەڕاندنەوەی شریتی خوارەوە (Bottom Navigation Bar) ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "سەرەکی"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "گەڕان"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "کڕینەکان"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "پڕۆفایل"),
        ],
      ),
    );
  }

  Widget buildHomeScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: Text("بەشەکان", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          // --- بەشی بازنەیی بەشەکان ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryItem("شیرینی", Icons.cake, Colors.pink.withOpacity(0.2), Colors.pink),
              categoryItem("مارکێت", Icons.shopping_cart, Colors.blue.withOpacity(0.2), Colors.blue),
              categoryItem("دەرمان", Icons.medical_services, Colors.red.withOpacity(0.2), Colors.red),
              categoryItem("خواردن", Icons.restaurant, Colors.orange.withOpacity(0.2), Colors.orange),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 30),
            child: Text("باشترین شوێنەکان", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          // --- کارتی شوێنەکان ---
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: const EdgeInsets.all(15),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.8,
            children: [
              storeCard(context, "چێشتخانەی کوردی", "١٢ جۆر بەردەستە", Icons.restaurant_menu, true),
              storeCard(context, "دەرمانخانەی ژین", "٤٥ جۆر بەردەستە", Icons.medical_information, false),
              storeCard(context, "پیتزا ستار", "٨ جۆر بەردەستە", Icons.local_pizza, false),
              storeCard(context, "فیست فوود", "١٥ جۆر بەردەستە", Icons.fastfood, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryItem(String title, IconData icon, Color bg, Color iconColor) {
    return Column(
      children: [
        CircleAvatar(radius: 30, backgroundColor: bg, child: Icon(icon, color: iconColor)),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget storeCard(BuildContext context, String name, String sub, IconData icon, bool clickable) {
    return GestureDetector(
      onTap: () {
        if (clickable) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodListPage(restaurantName: "چێشتخانەی کوردی")));
        }
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 35, backgroundColor: Colors.white10, child: Icon(icon, color: Colors.greenAccent.withOpacity(0.7), size: 35)),
            const SizedBox(height: 15),
            Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            const SizedBox(height: 5),
            const Icon(Icons.keyboard_arrow_down, color: Colors.greenAccent, size: 20),
          ],
        ),
      ),
    );
  }
}