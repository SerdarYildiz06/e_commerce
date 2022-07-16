import 'package:e_commerce/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
class _HomeScreenState extends State<HomeScreen> {
  String category = 'smartphones';
  void getProduct() {
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    productsProvider.getProductsOfCategory(category: category);
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        Column(
          children: [
            Text(productsProvider.productService.toString()),
            Text(productsProvider.images)
          ],
        ),
      ]),
    );
  }
}
