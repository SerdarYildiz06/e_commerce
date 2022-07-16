import 'package:e_commerce/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bottomNavBar/bottom_nav_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingProvider onboardingProvider = Provider.of<OnboardingProvider>(context);
    onboardingProvider.init();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 70),
            SizedBox(
              height: 500,
              child: PageView(
                controller: onboardingProvider.pageController,
                children: const [
                  OnboardingWidget(
                    title: 'Başlık 1',
                    description: 'Açıklayıcı metin 1',
                    image: 'Resim 1',
                  ),
                  OnboardingWidget(
                    title: 'Başlık 2',
                    description: 'Açıklayıcı metin 2',
                    image: 'Resim 2',
                  ),
                  OnboardingWidget(
                    title: 'Başlık 3',
                    description: 'Açıklayıcı metin 3',
                    image: 'Resim 3',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 3; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: onboardingProvider.currentPage == i
                            ? Colors.blue
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (onboardingProvider.pageController.page! < 2) {
                      onboardingProvider.increaseCurrentPage();
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const BottomNavBar()),
                          (route) => false);
                    }
                  },
                  child: const Text('Devam Et'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 295,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(image),
          ),
        ),
        const SizedBox(height: 70),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 36,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 44,
          child: Center(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue[800],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
