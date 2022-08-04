import 'package:e_commerce/providers/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarProvider bottomNavBarProvider =
        Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: bottomNavBarProvider.currentPage(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: bottomNavBarProvider.currentIndex,
          onTap: (value) {
            bottomNavBarProvider.setCurrentIndex(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search Screen'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile Screen'),
          ]),
    );
  }
}
