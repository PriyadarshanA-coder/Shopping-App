import 'package:demo/cart_page.dart';
import 'package:demo/setting_page.dart';
import 'package:demo/tab_bar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final Color softBeige = Color(0xFFFDF6EC);

  final List<Widget> _pages = [
    TabBars(), // Home
   CartPage(), // Cart
   SettingPage(), // Settings
  ];

  // Properly merged dispose() method to clear resources
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose(); // Always call super.dispose() last
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) => setState(() => _currentIndex = index),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Bottom Navigation Bar (same as before)
  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
          color: Color(0xFFFDF6EC),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF7B5E57),
          unselectedItemColor:Color(0xFFCBBFAD),
        ),
      ),
    );
  }
}
