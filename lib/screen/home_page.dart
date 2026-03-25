import 'package:flutter/material.dart';
import '../widgets/shop_card.dart';
import 'profile_page.dart';
import 'store_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ئەم گۆڕاوە دیاری دەکات کام لاپەڕە نیشان بدەین
  int _selectedIndex = 0;

  // لیستی ئەو لاپەڕانەی کە لە شریتی خوارەوە هەن
  final List<Widget> _pages = [
    const HomeContent(), // ناوەڕۆکی لاپەڕەی سەرەکی
    const Center(child: Text("لاپەڕەی گەڕان", style: TextStyle(color: Colors.white))), // کاتییە
    const Center(child: Text("لاپەڕەی کڕینەکان", style: TextStyle(color: Colors.white))), // کاتییە
    const ProfilePage(), // لاپەڕەی پڕۆفایل کە دروستمان کرد
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // لێرەدا بەپێی ئیندێکسەکە لاپەڕەکە دەگۆڕێت
      body: _pages[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // دیاریکردنی ئایکۆنی چالاک
        onTap: _onItemTapped, // فۆنکشنی گۆڕینی لاپەڕە
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "سەرەکی"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "گەڕان"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "کڕینەکان"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "پڕۆفایل"),
        ],
      ),
    );
  }
}

// ئەمە هەمان ئەو ناوەڕۆکەیە کە پێشتر لە ناو Body هەبوو
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text("Barakat Service", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white))],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text("بەشەکان", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildCategoryItem(Icons.restaurant, "خواردن", Colors.orange),
              _buildCategoryItem(Icons.medical_services, "دەرمان", Colors.red),
              _buildCategoryItem(Icons.shopping_cart, "مارکێت", Colors.blue),
              _buildCategoryItem(Icons.cake, "شیرینی", Colors.pink),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("باشترین شوێنەکان", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.70,
            children: [
              ShopCard(
                title: "چێشتخانەی کوردی",
                itemCount: "١٢",
                logoIcon: Icons.restaurant_menu,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreDetailsPage(storeName: "چێشتخانەی کوردی"))),
              ),
              ShopCard(
                title: "دەرمانخانەی ژین",
                itemCount: "٤٥",
                logoIcon: Icons.local_pharmacy,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreDetailsPage(storeName: "دەرمانخانەی ژین"))),
              ),
              // دەتوانیت کارتەکانی تریش لێرە دابنێیتەوە...
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}