import 'package:e_commerce/providers/login_provider.dart';
import 'package:e_commerce/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../services/hive_service/secure_storage_service.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  void initState() {
    super.initState();
    final userInfo = Provider.of<LoginProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(loginProvider.userName.toString()),
            Text(loginProvider.firstName.toString()),
            Text(loginProvider.lastName.toString()),
            const SizedBox(height: 50),
            SizedBox(
                height: 200,
                width: 200,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        context.read<LoginProvider>().profilePhoto.toString()))),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Email :example@hotmail.com'),
            SizedBox(
              height: 100,
              width: 100,
              child: LottieBuilder.network(
                  'https://assets9.lottiefiles.com/private_files/lf30_zlku8evq.json'),
            ),
            ListTile(
                leading: const Text('Logout'),
                trailing: GestureDetector(
                    onTap: () async {
                      await SecureStorageService().clear();
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => const LoginScreen())));
                    },
                    child: const Icon(Icons.exit_to_app))),
          ],
        ),
      ),
    );
  }
}
