import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  bool inited = false;

  void init() {
    if (!inited) {
      pageController.addListener(() {
        currentPage = pageController.page!.round();
        notifyListeners();
      });
      inited = true;
    }
  }

  void increaseCurrentPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }

  void decreaseCurrentPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }
}
