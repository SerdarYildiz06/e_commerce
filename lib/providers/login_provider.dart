import 'package:flutter/material.dart';

import '../models/auth/login_response.dart';
import '../screens/bottomNavBar/bottom_nav_bar.dart';
import '../services/auth_service.dart';
import '../services/hive_service/secure_storage_service.dart';
import '../utils/helpers/my_snackbar.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginResponse? loginResponse;
  bool obscurePassword = true;
  final formKey = GlobalKey<FormState>();
  bool onboardingShown = false;
  bool loading = false;
  String? userName;
  String? firstName;
  String? lastName;
  String? profilePhoto;

  void setUserName(String? value) {
    userName = value;
  }

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
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
    loginResponse = await AuthService()
        .login(userName: usernameController.text, password: passwordController.text);

    if (loginResponse != null) {
      userName = loginResponse?.username.toString();
      firstName = loginResponse!.firstName.toString();
      lastName = loginResponse!.lastName.toString();
      profilePhoto = loginResponse!.image.toString();

      await SecureStorageService().set('loggedIn', 'true');
      print('loginResponse.token : ${loginResponse!.token}');
      await SecureStorageService().set('token', loginResponse!.token);

      print(loginResponse!.toMap());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (route) => false);
    }
  }
}
