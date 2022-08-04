import 'package:e_commerce/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsProvider>(
        create: (context) => ProductsProvider(),
        builder: (context, child) {
          return Scaffold(
            body: Column(
              children: [
                Selector<ProductsProvider, bool>(builder: (context, value, child) {
                  return value ? const Placeholder() : const Text('data');
                }, selector: (context, provider) {
                  return provider.loading;
                }), //bool durumu diniliyorum loading satate göre
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: context
                        .watch()<ProductsProvider>()
                        .productsOfaCategory
                        .product
                        .length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(context
                              .read()<ProductsProvider>()
                              .productsOfaCategory
                              .product
                              .brand),
                          leading: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(context
                                .read()<ProductsProvider>()
                                .productsOfaCategory
                                .product
                                .image),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
