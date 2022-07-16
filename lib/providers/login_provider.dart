import 'package:flutter/material.dart';

import '../models/auth/login_response.dart';
import '../screens/home/home_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../services/auth_service.dart';
import '../services/hive_service/secure_storage_service.dart';
import '../utils/helpers/my_snackbar.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  final formKey = GlobalKey<FormState>();
  bool onboardingShown = false;
  String? userName;
  String? profilPage;
  void setUserName(String? value) {
    userName = value;
  }

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> checkOnboardingStatus() async {
    String? _onboardingShown = await SecureStorageService().get('onboardingShown');
    onboardingShown =
        _onboardingShown == 'false' || _onboardingShown == null ? false : true;
    print('onboardingShown : $onboardingShown');
  }

  Future<void> login(context) async {
    if (userName == null || usernameController.text.isEmpty) {
      MySnackbar.show(context, message: 'Please enter an username');
      return;
    }
    if (usernameController.text.length < 10) {
      MySnackbar.show(context, message: 'Please enter a 10 digit username');
      return;
    }
    if (passwordController.text.isEmpty) {
      MySnackbar.show(context, message: 'Please enter your password');
      return;
    }
    LoginResponse? loginResponse = await AuthService()
        .login(userName: usernameController.text, password: passwordController.text);
    if (loginResponse != null) {
      profilPage = loginResponse.image;
      await SecureStorageService().set('loggedIn', 'true');
      print('loginResponse.token : ${loginResponse.token}');
      await SecureStorageService().set('token', loginResponse.token);
      print(loginResponse.toMap());
      await checkOnboardingStatus();
      if (!onboardingShown) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      }
    }
  }
}
