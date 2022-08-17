import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../screens/bottomNavBar/bottom_nav_bar.dart';
import '../screens/login/login_screen.dart';
import '../services/hive_service/secure_storage_service.dart';

class SplashProvider extends ChangeNotifier {
  bool navigated = false;
  Duration duration = const Duration(seconds: 1);
  bool loggedIn = false;
  bool navigatedToShare = false;

  void setNavigatedToShare(bool value) {
    navigatedToShare = value;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    String? _loggedIn = await SecureStorageService().get('loggedIn');
    loggedIn = _loggedIn == 'false' || _loggedIn == null ? false : true;
    print('loggedIn : $loggedIn');
  }

  Future<void> init(context) async {
    await Hive.initFlutter();

    if (!navigated) {
      navigated = true;
      checkAuthStatus();
      await Future.delayed(duration);
      if (navigatedToShare) {
        return;
      }
      if (!loggedIn) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
        return;
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (route) => false);
    }
  }
}
