import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: LonelyApp(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ));

class LonelyApp extends StatefulWidget {
  @override
  _LonelyAppState createState() => _LonelyAppState();
}

class _LonelyAppState extends State<LonelyApp> {
  int _selectedIndex = 0;

  // شاشات التطبيق الأساسية
  final List<Widget> _screens = [
    TikTokHome(),      // واجهة تيك توك
    ExploreScreen(),   // اكتشف
    LiveStreamScreen(),// البث المباشر
    StoreScreen(),     // متجر التيجان
    ProfileScreen(),   // الملف الشخصي واليوزر الثلاثي
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white24,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "اكتشف"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box, size: 40, color: Colors.amber), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "المتجر"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "الملكي"),
        ],
      ),
    );
  }
}

// --- 1. واجهة تيك توك Lonely ---
class TikTokHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.black, child: Center(child: Icon(Icons.play_circle_fill, size: 80, color: Colors.white10))),
          Positioned(
            right: 15, bottom: 100,
            child: Column(
              children: [
                _actionIcon(Icons.favorite, "1.2K", Colors.red),
                _actionIcon(Icons.comment, "300", Colors.white),
                GestureDetector(
                  onTap: () => _showGifts(context),
                  child: _actionIcon(Icons.workspace_premium, "دعم", Colors.amber),
                ),
              ],
            ),
          ),
          Positioned(left: 15, bottom: 30, child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("@V_V_V", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18)),
              Text("أول يوزر ثلاثي في Lonely 👑", style: TextStyle(color: Colors.white)),
            ],
          )),
        ],
      ),
    );
  }

  Widget _actionIcon(IconData icon, String label, Color color) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Column(children: [Icon(icon, color: color, size: 35), Text(label, style: TextStyle(fontSize: 12))]));
  }
}

// --- 2. متجر التيجان الملكي ---
class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("متجر Lonely 👑"), backgroundColor: Colors.black),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildStoreItem("100 تاج", "2\$", Icons.stars),
          _buildStoreItem("1000 تاج", "12\$", Icons.stars),
          _buildStoreItem("5000 تاج", "45\$", Icons.stars),
          Divider(color: Colors.amber),
          _buildStoreItem("يوزر ثلاثي (نادر)", "5000 👑", Icons.verified_user, isSpecial: true),
        ],
      ),
    );
  }

  Widget _buildStoreItem(String name, String price, IconData icon, {bool isSpecial = false}) {
    return Card(
      color: Colors.white10,
      child: ListTile(
        leading: Icon(icon, color: Colors.amber),
        title: Text(name),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: isSpecial ? Colors.amber : Colors.green),
          onPressed: () {}, child: Text(price, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

// --- 3. نافذة الهدايا (الحوت والنمر) ---
void _showGifts(BuildContext context) {
  showModalBottomSheet(
    context: context, backgroundColor: Colors.black87,
    builder: (context) => GridView.count(
      crossAxisCount: 4, padding: EdgeInsets.all(20),
      children: [
        _gift(Icons.favorite, "وردة", "5"),
        _gift(Icons.auto_awesome, "نسر", "15"),
        _gift(Icons.waves, "حوت", "80"),
        _gift(Icons.pets, "نمر", "300"),
        _gift(Icons.rocket_launch, "الحوت الكبير", "700"),
      ],
    ),
  );
}

Widget _gift(IconData icon, String name, String price) {
  return Column(children: [Icon(icon, color: Colors.amber), Text(name, style: TextStyle(fontSize: 10)), Text("$price 👑", style: TextStyle(color: Colors.amber, fontSize: 10))]);
}

// شاشات فرعية (تحتاج ربط السيرفر لتكتمل)
class ExploreScreen extends StatelessWidget { @override Widget build(BuildContext context) => Center(child: Text("قريباً: جولات PK 🥊")); }
class LiveStreamScreen extends StatelessWidget { @override Widget build(BuildContext context) => Center(child: Text("فتح بث مباشر 🎥")); }
class ProfileScreen extends StatelessWidget { @override Widget build(BuildContext context) => Center(child: Text("الملف الشخصي الملكي 👤")); }
