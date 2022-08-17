import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/search_bar_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    final getSearchItem = Provider.of<SearchBarProvider>(context, listen: false);
    getSearchItem.getSingleProduct(product: 'samsung');
  }

  @override
  Widget build(BuildContext context) {
    SearchBarProvider searchBarProvider =
        Provider.of<SearchBarProvider>(context, listen: true);
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        TextField(
          controller: searchBarProvider.searchController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
              fillColor: Colors.black.withOpacity(0.2),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              suffixIcon: IconButton(
                onPressed: () {
                  searchBarProvider.getSingleProduct(
                      product: searchBarProvider.searchController.text);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              hintText: 'Search Product',
              hintStyle: const TextStyle(color: Colors.white)),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: searchBarProvider.singleProduct!.products!.length,
            itemBuilder: (context, index) {
              Products products = searchBarProvider.singleProduct!.products![index];

              print('SEARCH' +
                  searchBarProvider.singleProduct!.products!.first.brand.toString());
              print('brand' + products.brand.toString());
              return Card(
                child: Column(children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        // Image.network(searchBarProvider
                        //     .singleProduct!.products!.first.images!.first),
                        Image.network(products.images!.first),
                      ],
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ]),
    );
  }
}
