import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: loginProvider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_mjlh3hcy.json',
                      height: 300,
                      width: 600),
                  const SizedBox(height: 44),
                  TextFormField(
                    controller: loginProvider.usernameController..text = 'kminchelle',
                    onChanged: (value) {
                      loginProvider.setUserName(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.grey,
                      contentPadding:
                          const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: loginProvider.passwordController..text = '0lelplR',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.grey,
                      contentPadding:
                          const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        color: Colors.black,
                        onPressed: loginProvider.toggleObscurePassword,
                        icon: Icon(loginProvider.obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    obscureText: loginProvider.obscurePassword,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        loginProvider.login(context);
                      },
                      child: const Text('Giriş'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
