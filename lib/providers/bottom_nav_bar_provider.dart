import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/home/search_screen.dart';
import '../screens/profil/profil_screen.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> pages = [const HomeScreen(), const SearchScreen(), const ProfilScreen()];

  Widget currentPage() {
    return pages[currentIndex];
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
