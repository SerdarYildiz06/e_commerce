import 'package:e_commerce/providers/products_provider.dart';
import 'package:e_commerce/screens/home/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Category { smartphones, laptops, tops, motorcycle }

@override
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final products = Provider.of<ProductsProvider>(context, listen: false);
      products.getProductsOfCategory(category: Category.laptops.name);
      products.getProductsOfCategory(category: Category.smartphones.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: productsProvider.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'lib/assets/banner.jpg',
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Önce Çıkan Telefonlar',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsProvider.phone!.products!.length,
                      itemBuilder: (context, index) {
                        Products products = productsProvider.phone!.products![index];
                        return Card(
                          child: Column(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetailScreen(
                                              id: productsProvider
                                                  .phone!.products![index],
                                            )));
                              },
                              child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child:
                                      Image.network(products.images!.first.toString())),
                            ),
                          ]),
                        );
                      },
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Pre-release computers',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsProvider.productsOfaCategory!.products!.length,
                      itemBuilder: (context, index) {
                        Products products =
                            productsProvider.productsOfaCategory!.products![index];
                        return SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            child: Column(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetailScreen(
                                                id: productsProvider.productsOfaCategory!
                                                    .products![index],
                                              )));
                                },
                                child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child:
                                        Image.network(products.images!.first.toString())),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
