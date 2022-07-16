import 'package:e_commerce/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../providers/bottom_nav_bar_provider.dart';
import '../../providers/login_provider.dart';
import '../../providers/products_provider.dart';
import '../../providers/splash_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => SplashProvider()),
  ChangeNotifierProvider(create: (context) => LoginProvider()),
  ChangeNotifierProvider(create: (context) => OnboardingProvider()),
  ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
  ChangeNotifierProvider(create: (context) => ProductsProvider()),
];
