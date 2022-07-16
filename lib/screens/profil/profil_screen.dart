import 'package:e_commerce/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(loginProvider.userName.toString()),
          Image.network(loginProvider.profilPage.toString()),
        ],
      ),
    );
  }
}
