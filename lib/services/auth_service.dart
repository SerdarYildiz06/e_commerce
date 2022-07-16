import 'package:dio/dio.dart';
import 'package:e_commerce/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';

import '../models/auth/login_response.dart';

class AuthService {
  Dio dio = Dio();

  AuthService() {
    dio.options.baseUrl = ApiConstants.baseUrl;
  }
  Future<LoginResponse?> login(
      {required String userName, required String password}) async {
    debugPrint('USERNAME' + userName);
    debugPrint('Password' + password);

    Response response = await dio.post(
      ApiConstants.login,
      data: {
        'username': userName,
        'password': password,
      },
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    print('response.headers : ${response.headers}');

    if (response.statusCode == 200) {
      LoginResponse loginResponse = LoginResponse.fromJson(response.toString());
      return loginResponse;
    } else {
      return null;
    }
  }
}
